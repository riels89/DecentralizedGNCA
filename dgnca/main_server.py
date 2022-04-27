import socket
import sys
import pygsp
import numpy as np
from random import randint
from spektral.transforms import NormalizeSphere
from spektral.layers.ops import sp_matrix_to_sp_tensor
import threading
import json
import time
import matplotlib.pyplot as plt

from gnca.modules.graphs import get_cloud
from gnca.modules.init_state import SphericalizeState

port = 8055
host = 'localhost'
lock = threading.Lock()
points = []
#agreement = 0
nprocs = 0
# constant num, matches # of rounds done in run_nodes
rounds = 10

def sync_nodes(client, id, port, neighbor_ports, h_dict, barrier):

    global rounds
    sys.stdout.flush()
    encoded_neighbors = str.encode(json.dumps([neighbor_ports, h_dict]) + f"{id:03d}{port:05d}")
    client.send(encoded_neighbors)
    data = str(client.recv(4024), 'ascii')
    if data != "all_connected":
        print(f"{id} received something other than \'finished_round\': {data}")
        client.close()
        return
    else:
        print(f"{id} all connected")
    barrier.wait()
    # now starting round-timestep confirmations
    i = 0
    while (i < rounds):
        code = client.recv(100).decode("ascii")
        if (code == "round_finished"):
            print ("round " +str(i)+" finished for proc " + str(id) + "\n")
            barrier.wait()
            client.send (str.encode("next_round"))
        else:
            print ("ERROR: Invalid msg recv ("+code+") from client " +str(id)+" in server")
            break
        i = i + 1
    print ("proc " + str(id) + " finished all rounds\n")
    data = client.recv(10000).decode("ascii")
    h = np.fromstring(data[1:-1].replace(" ", ""), dtype=np.float32, sep=',')
    lock.acquire()
    points.append(h)
    lock.release()

    client.close()


if __name__ == "__main__":

    #### Setup ####
    # g = pygsp.graphs.Grid2d()
    g = get_cloud("Grid2d", N1=20, N2=20)
    g = NormalizeSphere()(g)
    #print(g)
    n = 16
    
    nprocs = n
    adj = np.squeeze(np.asarray(g.a.todense()))[:n, :n]
    # a = sp_matrix_to_sp_tensor(g.a)
    state = SphericalizeState(g.x[:n, :n])()
    print(state)
    print(state.shape)
    print(adj.shape)
    # adj = np.array([[0, 1, 1, 0],
    #                 [1, 0, 1, 1],
    #                 [1, 1, 0, 1],
    #                 [0, 1, 1, 0]])

    n = adj.shape[0]
    print(f"Starting server with {n} nodes")
    ids = range(n)
    neighbors = {i:[int(num) for num in np.where(adj[i])[0]] for i in ids}

    ports = []
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        for i in ids:
            node_port = randint(49152,65535) 
            while node_port in ports: #or s.connect_ex(('localhost', port)) == 0:
                node_port = randint(49152,65535) 
            ports.append(node_port)
            sys.stdout.flush ()

    # Creating Main Server
    mainServer = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    mainServer.bind((host, port))
    mainServer.listen()
    print("Listening on", (host, port))
    sys.stdout.flush ()
    barrier = threading.Barrier (nprocs)
    # Event Loop
    threads = []
    try:
        for id in ids:
            # accept connection from client
            client, addr = mainServer.accept()
            neighbor_list = neighbors[id]
            neighbor_ports = {neighbor_id: ports[neighbor_id] for neighbor_id in neighbor_list}
            h_dict = {neighbor_id: list(state[neighbor_id]) for neighbor_id in neighbor_list}
            h_dict[id] = list(state[id])
            thread = threading.Thread(target=sync_nodes, args=(client, id, ports[id], neighbor_ports, h_dict, barrier))
            threads.append(thread)
            thread.start()
        

    except KeyboardInterrupt:
        print("\nUser ended session")
        for thread in threads:
            thread.join()
        mainServer.close()

for thread in threads:
    thread.join()

plt.figure(figsize=(2.5, 2.5))
points = np.vstack(points)
# cmap = plt.get_cmap("Set2")
plt.scatter(points[:, 0], points[:, 1], marker=".", s=1)
plt.tight_layout()
plt.savefig(f"decentralized_endstate.pdf")
# plt.show()
mainServer.close()