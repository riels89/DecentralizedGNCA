import socket
import json

from sklearn import neighbors

import threading
import time
import copy
import os

host = 'localhost'
port = 8088
b = threading.Barrier(2)

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

def listen_for_neighbors(id, node_port, connection_dict, mutex, main_sock): 
    mutex.acquire()
    it_dict = copy.deepcopy(connection_dict)
    mutex.release()
    b.wait()

    num_to_recieve = 0
    for neighbor_id in it_dict.keys():
        if int(neighbor_id) > id:
            num_to_recieve += 1

    for i in range(num_to_recieve):
        conn = socket.create_server((host, node_port), backlog=len(connection_dict))
        conn.settimeout(20)
        try:
            conn, addr = conn.accept()
        except Exception as e:
            main_sock.send((f"Error: failed to accept \n" + str(e)).encode())
            raise Exception(f"{id}, failed to accept") from e

        if conn == 0:
            raise Exception(f"Failed to create listening connection.")
        else:
            # print(f"{id} Got connection")
            pass
        try:
            neighbor_id = conn.recv(512).decode("ascii")
        except Exception as e:
            # print("FAIL")
            raise Exception("f{id} failed to recv") from e
        # print(f"{id} successfully got connection {neighbor_id}")

        mutex.acquire()
        if neighbor_id not in connection_dict:
            # print(f"{id} {neighbor_id} not in dict")
            raise Exception(f"{id} listen {neighbor_id} not in dict")
        connection_dict[neighbor_id] = conn
        mutex.release()


def connect_to_neighbors(id, neighbor_ports, connection_dict, mutex, main_sock):
    mutex.acquire()
    it_dict = copy.deepcopy(connection_dict)
    mutex.release()
    b.wait()

    for neighbor_id, conn in it_dict.items():
        if int(neighbor_id) > id:
            continue

        conn = wait_for_port(id, host, neighbor_ports[neighbor_id], timeout=20)

        if conn == 0:
            raise Exception(f"Failed to create connection from {id} to {neighbor_id}")
        else:
            # print(f"{id} successfully connected to {neighbor_id}")
            pass
        try:
            conn.send(str(id).encode())
        except Exception as e:
            main_sock.send(("Error: \n" + str(e)).encode())
            raise Exception(f"{id}, failed to send to {neighbor_id}") from e

        mutex.acquire()
        if neighbor_id not in connection_dict:
            # print(f"{id} {neighbor_id} not in dict")
            raise Exception(f"{id} conn {neighbor_id} not in dict")
        connection_dict[neighbor_id] = conn
        mutex.release()

def createClient():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    # Connecting to the socket
    sock.connect((host, port))

    # Sending a message
    data = sock.recv(100000).decode('ascii')
    node_port = int(data[-5:])
    id = int(data[-8:-5])
    neighbor_ports = json.loads(data[:-8])
    connection_dict = {neighbor_id: None for neighbor_id in neighbor_ports.keys()}
    # print(f"{id} {neighbor_ports}")

    # if id == 1:
    #     print(f"{1} {connection_dict}")

    mutex = threading.Lock()
    connecting_thread = threading.Thread (target = connect_to_neighbors, args=(id, neighbor_ports, connection_dict, mutex, sock))
    connecting_thread.start()

    listen_for_neighbors(id, node_port, connection_dict, mutex, sock)
    connecting_thread.join()

    sock.send(b"all_connected")
    print(f"{id} finished")
    
    sock.close()

if __name__ == "__main__":
    createClient()
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

