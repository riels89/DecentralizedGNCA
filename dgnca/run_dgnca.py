import socket
import threading
import time
import math
import sys
from node import Node

num_procs = -1
host = 'localhost'
port_seed = 2000
servers = []
lock = threading.Lock()
sum = 0

def client (ip, port, message, wait, id, num_procs, s_time):
    # simulate computation
    time.sleep (wait)
    print (str(time.time()-s_time-wait) +"\n"+ str(id) + " "+ str(neighbors (id, num_procs)))
    print ()
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.connect((ip, port))
        sock.sendall(bytes(message, 'ascii'))
        response = str(sock.recv(1024), 'ascii')
        print("Received: {}".format(response))
        
        
# returns int arr of all neighboring ids
# assumes # of procs is pow of 2
# and neighbors are what they are in a log2(n)xlog2(n) array
# diagonals are not neighbors
def neighbors (id, num_proc):
    neighbors = []
    base = math.floor (math.log2 (num_proc))
    if (id % base != 0):
        neighbors.append (id-1)
    if (id % base != base-1):
        neighbors.append (id+1)
    if (id - base >= 0):
        neighbors.append (id - base)
    if (id + base < num_proc):
        neighbors.append (id + base)
    return neighbors
     
def init_threads (id, barrier):
    server = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
    print ("id=" +str(id))
    global sum
    # binds servers in consective ports
    server.bind ((host, port_seed + id))
    #print ("server " + str(i) + " created")
    server.listen (num_procs)
    node_lock = threading.Lock()
    server_node = Node (server, id, port_seed+id, num_procs, node_lock)
    lock.acquire()
    servers.append (server_node)
    lock.release()
    barrier.wait()
    
    for neighbor in neighbors (id, num_procs):
        server_communicator = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
        lock.acquire()
        servers[i].addCommunicator (server_communicator, id)
        sum = sum + 1
        lock.release()
    return;


# messanger loop
def messanger_loop (node):

    while True:
        #acquires lock
        node.getLock().acquire()
        # checks if node has message to send
        if (node.hasMessage):
            for port in (node.getMessagePorts()):
                node.sendMessage (node.getMessage(), port)
            # all messages have been sent
            node.finishedMessages()
        node.getLock().release()
        
        if (node.isDone())
            return;
        # waits to give other messanger-server threads in node
        # a chance
        wait (.01)
        

# ** main loop **
def server_loop (node):
    intermediate_work_done = False
    all_finished = False
    
    message = "" + str (node.getId())
    while True:
        # do work
        # get work in byte stream to send
        # get and set message in node
        node.getLock().acquire()
        if (intermediate_work_done):
            node.setMessage (message)
            ports = []
            for neighbor in neighbors (node.getId(), num_procs):
                ports.append(port_seed + neighbor)
        node.getLock().release()
        # recieve messages
        
        # do more work
        
        # check if done
        if (all_finished)
            return;
     
if __name__ == "__main__":
    #### Setup ####

    servers = []
    
    num_procs = 0
    if (len(sys.argv) != 2):
        print ("invalid usage: lacking num_proccesses")
        print ("valid usage: python run_dgnca <num processes>")
        quit()
    try:
        num_procs = int(sys.argv[1])
        print (num_procs)
    except ValueError:
        print ("invalid usage: please enter a processes count to a power of 2")
        print ("valid usage: python run_dgnca <num processes>")
        quit()
       
       
    # load model
    # load data
       
    barrier = threading.Barrier (num_procs)
    
    
    server_threads = []
    # spawn servers
    for i in range (num_procs):
        t = threading.Thread (target=init_threads, args=(i, barrier))
        server_threads.append(t)
        t.start()
        
    for t in server_threads:
        t.join()
    # now we have num_proc nodes
    print("num connections=" + str(sum))
    server_threads = []
    messanger_threads = []
    for nodes in servers:
        m = threading.Thread (target=messanger_loop)
        s = threading.Thread (target=server_loop)
    
    print ("starting main loops")
    for i in range(len(server_threads)):
        #server_threads[i].start()
        #messanger_threads[i].start()
        
    print ("ending program")
    for i in range(len(server_threads)):
        # join threads
        #server_threads[i].join()
        #messanger_threads[i].join()
        #servers[i].getServer().close()
    pass


