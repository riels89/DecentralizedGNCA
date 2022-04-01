import socket
import sys
import pygsp
import numpy as np
from random import randint

from _thread import *
import threading
import json

from dgnca import select_node


port = 8080
host = 'localhost'
print_lock = threading.Lock()


def threaded(client, id, port, neighbor_ports, node_order):

    in_node_order = "T" if id in node_order[0] else "F"
    num_to_recieve = 0
    if in_node_order == "F":
        for neighbor_id in neighbor_ports.keys():
            if neighbor_id in node_order[0]:
                num_to_recieve += 1

    print(node_order[0])
    encoded_neighbors = str.encode(json.dumps(neighbor_ports) + f"{id:03d}{port:05d}{in_node_order}{num_to_recieve:03d}")
    print(f"{id} {neighbor_ports}")
    client.send(encoded_neighbors)

    data = str(client.recv(1024), 'ascii')
    print(f"{id} recieved: {data}")
    if data != "finished_round" and data != "all_connected":
        print(f"{id} received something other than \'finished_round\'")
        client.close()
        return
    
    print("Finished")

    client.close()


if __name__ == "__main__":

    #### Setup ####
    g = pygsp.graphs.Grid2d()
    adj = np.squeeze(np.asarray(g.W.todense()))[:50, :50]
    # adj = np.array([[0, 1, 1, 0],
    #                 [1, 0, 1, 1],
    #                 [1, 1, 0, 1],
    #                 [0, 1, 1, 0]])
    node_order = select_node(adj)
    print(f'node order {node_order}')

    n = adj.shape[0]
    print(n)
    ids = range(n)
    neighbors = {i:[int(num) for num in np.where(adj[i])[0]] for i in ids}

    ports = []
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        for i in ids:
            node_port = randint(49152,65535) 
            while node_port in ports or s.connect_ex(('localhost', port)) == 0:
                node_port = randint(49152,65535) 
            ports.append(node_port)

    # Creating Main Server
    mainServer = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    mainServer.bind((host, port))
    mainServer.listen()
    print("Listening on", (host, port))

    # Event Loop
    try:
        for id in ids:
            # accept connection from client
            client, addr = mainServer.accept()

            #print_lock.acquire()
            neighbor_list = neighbors[id]
            print(f"{id} neighbor list: {neighbor_list}")
            neighbor_ports = {neighbor_id: ports[neighbor_id] for neighbor_id in neighbor_list}

            start_new_thread(threaded, (client, id, ports[id], neighbor_ports, node_order))

        while True:
            pass
    except KeyboardInterrupt:
        print("\nUser ended session")
    finally:
        mainServer.close()


    # load model
    # load data
    # Connect to main node
    # get rank from main node
    # use rank to choose data to use
    # connected to neighbors

    ### Main loop ###
    # while no stop signal
    #   Compute update
    #   Check for stop signal

    #   Broadcast update using tcp
    #   Check for stop signal

    #   Retrieve update from tcp buffer
    #   Update data buffer
    pass
    
