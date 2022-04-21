import socket
import json
import tensorflow as tf
import keras
import numpy as np
import sys

import threading
import time
import copy
from io import StringIO


from dgnca import DecentralizedGNN

host = 'localhost'
port = 8055

class Node():

    def __init__(self, id, main_sock, server_port, neighbor_ports, h_dict) -> None:
        self.id = id
        self.main_sock = main_sock
        self.server_port = server_port
        self.neighbor_ports = neighbor_ports
        self.h_dict = h_dict
        self.connection_dict = {neighbor_id: None for neighbor_id in neighbor_ports.keys()}

def wait_for_port(id, host, port_to_conn, timeout=5.0):
    """
    https://gist.github.com/butla/2d9a4c0f35ea47b7452156c96a4e7b12
    """
    start_time = time.time()
    while True:
        try:
            conn = socket.create_connection((host, port_to_conn))
            return conn
        except OSError as e:
            time.sleep(0.1)
            end_time = time.time()
            if end_time - start_time>= timeout:
                # print(f"{id} {end_time - start_time}")
                raise TimeoutError('{} Waited too long for the port {} on host {} to start accepting '
                                   'connections.'.format(id, port_to_conn, host)) from e
        except Exception as e:
            raise Exception('{} Error waiting for the port {} on host {} to start accepting '
                                'connections.'.format(id, port_to_conn, host)) from e


def listen_for_neighbors(node: Node, mutex, barrier):
    mutex.acquire()
    it_dict = copy.deepcopy(node.connection_dict)
    mutex.release()
    barrier.wait()

    num_to_recieve = 0
    for neighbor_id in it_dict.keys():
        if int(neighbor_id) > node.id:
            num_to_recieve += 1

    serv = socket.create_server((host, node.server_port), backlog=len(node.connection_dict))
    serv.settimeout(20)
    for i in range(num_to_recieve):
        try:
            conn, addr = serv.accept()
        except Exception as e:
            node.main_sock.send((f"Error: failed to accept \n" + f"\ndict: {node.connection_dict}" + str(e)).encode())
            raise Exception(f"{node.id}, failed to accept") from e

        if conn == 0:
            raise Exception(f"Failed to create listening connection.")

        try:
            neighbor_id = conn.recv(512).decode("ascii")
        except Exception as e:
            raise Exception("f{id} failed to recv") from e

        mutex.acquire()
        if neighbor_id not in node.connection_dict:
            raise Exception(f"{node.id} listen {neighbor_id} not in dict")
        node.connection_dict[neighbor_id] = conn
        mutex.release()


def connect_to_neighbors(node: Node, mutex, barrier):
    mutex.acquire()
    it_dict = copy.deepcopy(node.connection_dict)
    mutex.release()
    barrier.wait()

    for neighbor_id, conn in it_dict.items():
        if int(neighbor_id) > node.id:
            continue

        conn = wait_for_port(node.id, host, node.neighbor_ports[neighbor_id], timeout=20)

        if conn == 0:
            raise Exception(f"Failed to create connection from {id} to {neighbor_id}")

        try:
            conn.send(str(node.id).encode())
        except Exception as e:
            node.main_sock.send(("Error: \n" + str(e)).encode())
            raise Exception(f"{node.id}, failed to send to {neighbor_id}") from e

        mutex.acquire()
        if neighbor_id not in node.connection_dict:
            raise Exception(f"{node.id} conn {neighbor_id} not in dict")

        node.connection_dict[neighbor_id] = conn
        mutex.release()

def connect_neighbors(node: Node):
    mutex = threading.Lock()
    barrier = threading.Barrier(2)

    connecting_thread = threading.Thread (target = connect_to_neighbors, args=(node, mutex, barrier))
    connecting_thread.start()

    listen_for_neighbors(node, mutex, barrier)
    connecting_thread.join()

    node.main_sock.send(b"all_connected")
    print(f"{node.id} finished")

def connect_to_main():
    main_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Connecting to the socket
    main_sock.connect((host, port))
    # Sending a message
    data = main_sock.recv(100000).decode('ascii')
    server_port = int(data[-5:])
    id = int(data[-8:-5])
    dict_list = json.loads(data[:-8])
    neighbor_ports = dict_list[0]
    h_dict = dict_list[1]

    return Node(id=id, main_sock=main_sock, server_port=server_port, neighbor_ports=neighbor_ports, h_dict=h_dict)

def load_model(x):
    loaded_model = keras.models.load_model("results/grid2d/model").get_layer(name="general_gnn")

    dec_model = DecentralizedGNN(2, message_passing=1, pool=None, batch_norm=False, hidden_activation="relu")
    dec_model(x)
    # x = keras.Input([4, 2])
    # keras.Model(inputs=x, outputs=dec_model.call(x)).summary()

    weight_mapping = {"mlp": "mlp", "mlp_1": "mlp_1", "general_conv": "general_conv_wrapper"}
    dec_model.load_weights_from_spektral(loaded_model, weight_mapping)

    return dec_model

def make_input_tensor(node: Node):
    # make h_list, this nodes h must be first
    # This is assuming neighbor h doesn't matter, which is true for addition connectivity
    h_list = [node.h_dict[str(node.id)], *[node.h_dict[nid] for nid in node.connection_dict.keys()]]
    # print(f"{node.id}: {h_list}")

    return tf.expand_dims(tf.convert_to_tensor(h_list), axis=0)

def send_h(h, node: Node):
    serialized = np.array2string(h.numpy(), precision=32, separator=",").encode()
    print(f"{node.id}: {serialized}")
    for conn in node.connection_dict.values():
        # conn.send(tf.io.serialize_tensor(h))
        conn.send(serialized)

def recv_h(node: Node):
    for nid, conn in node.connection_dict.items():
        data = conn.recv(10000).decode("ascii")
        h = np.fromstring(data[1:-1].replace(" ", ""), dtype=np.float32, sep=',')
        #print(f"{data}: {h}")
        node.h_dict[nid] = h 

if __name__ == "__main__":
    node = connect_to_main()
    connect_neighbors(node)
    h = make_input_tensor(node)
    model = load_model(h)
    local_h = model(h)

    for i in range(10):
        # do round work
        local_h = tf.reshape(model(h), -1)
        send_h(local_h, node)
        # now that sends 2 neighbors are done, wait for signal from main
        node.main_sock.send (str.encode("round_finished"))
        # wait for main to send signal to continue round
        msg = node.main_sock.recv (100).decode("ascii")
        if (msg != "next_round"):
            print ("ERROR: Invalid msg ("+msg+") recv from server in client " + str(id))
        # now recv and continue
        recv_h(node)

        node.h_dict[node.id] = local_h.numpy()
        h = make_input_tensor(node)
        # *** round work finished ***


    serialized = np.array2string(local_h.numpy(), precision=32, separator=",").encode()
    node.main_sock.send(serialized)




    # num_procs = 100
    
    # threads = []
    # for i in range(num_procs):
        # thread = threading.Thread (target = createClient)
        # pid = os.fork()
        # if pid == 0:
        #     createClient()
        # threads.append(thread)
        # thread.start()
    
    # for thread in threads:
    #     thread.join()
    
    # print(f'Created: {len(threads)} clients')

    # for thread in threads:
    #     thread.join()
    
    # print(f'Closed: {len(threads)} clients')
    # createClient()

