import socket
import json

from sklearn import neighbors
from node import Node

import threading
import time

host = 'localhost'
port = 8081

def wait_for_port(id, host, port_to_conn, timeout=5.0):
    """
    https://gist.github.com/butla/2d9a4c0f35ea47b7452156c96a4e7b12
    """
    start_time = time.perf_counter()
    while True:
        try:
            conn = socket.create_connection((host, port_to_conn))
            return conn
        except OSError as e:
            time.sleep(0.1)
            if time.perf_counter() - start_time >= timeout:
                raise TimeoutError('{} Waited too long for the port {} on host {} to start accepting '
                                   'connections.'.format(id, port_to_conn, host)) from e



def createClient():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    # Connecting to the socket
    sock.connect((host, port))

    # Sending a message
    data = sock.recv(100000).decode('ascii')
    num_to_recieve = int(data[-3:])
    is_connecting = data[-4] == 'T'
    node_port = int(data[-9:-4])
    id = int(data[-12:-9])
    neighbor_ports = json.loads(data[:-12])
    connection_dict = {neighbor_id: None for neighbor_id in neighbor_ports.keys()}

    if id == 1:
        print(f"{1} {connection_dict}")

    while(None in list(connection_dict.values())):
        print(f"{id} Entered while")
        if is_connecting:
            for neighbor_id, conn in connection_dict.items():
                if conn is not None:
                    continue

                conn = wait_for_port(id, host, neighbor_ports[neighbor_id])

                if conn == 0:
                    print(f"Failed to create connection from {id} to {neighbor_id}")
                else:
                    print(f"{id} successfully connected to {neighbor_id}")
                try:
                    conn.send(str(id).encode())
                except Exception as e:
                    raise Exception(f"{id}, failed to send") from e
                connection_dict[neighbor_id] = conn
        else:
            print(f"{id} Attempting listen")
            for i in range(num_to_recieve):
                conn = socket.create_server((host, node_port), backlog=len(connection_dict))
                conn, addr = conn.accept()
                if conn == 0:
                    print(f"Failed to create listening connection.")
                neighbor_id = conn.recv(1024).decode("ascii")
                print(f"{id} successfully got connection {neighbor_id}")
                connection_dict[neighbor_id] = conn

        if None in list(connection_dict.values()):
            sock.send(b"finished_round")
            data = sock.recv(100000).decode('ascii')
            print(f"{id} data: {data}")
            num_to_recieve = int(data[-3:])
            is_connecting = data[-4] == 'T'

    sock.send(b"all_connected")
    print(f"{id} finished")
    
    # while sendCount < 6:
    #     message = f'Node: {myNode.getId()}, sent: {sendCount}'
    #     sock.send(message.encode('ascii'))

    #     data = sock.recv(1024)

    #     print(f"Received from server: {str(data.decode('ascii'))}")
    #     sendCount += 1
    
    sock.close()

if __name__ == "__main__":
    num_procs = 256
    
    threads = []
    for i in range(num_procs):
        thread = threading.Thread (target = createClient)
        threads.append(thread)
        thread.start()
    
    for thread in threads:
        thread.join()
    
    print(f'Created: {len(threads)} clients')

    for thread in threads:
        thread.join()
    
    print(f'Closed: {len(threads)} clients')

