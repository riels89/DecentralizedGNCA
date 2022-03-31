import socket
import threading
import time
import math
import sys
from node import Node

num_procs = -1
host = 'localhost'
port_seed = 2000
BUFFER_SIZE = 512
servers = []
lock = threading.Lock()

sum = 0

# *** depreciated **** ##
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
    sem = threading.Semaphore(1)
    server_node = Node (server, id, port_seed+id, num_procs, node_lock, sem)
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
def messanger_loop (id, node):
    while True:
        #acquires lock
        node.getSemaphore().acquire()
        node.getLock().acquire()
        # checks if node has message to send
        if (node.hasMessage()):
            # get ports of neighboring nodes to send to
            for port in (node.getMessagePorts()):
                node.sendMessage (node.getMessage(), port)
            # all messages have been sent
            node.finishedMessages()
        node.getLock().release()
        node.getSemaphore().release()
        
        #print ("checking if done")
        if (node.getIsDone()):
            return
        # waits to give other messanger-server threads in node
        # a chance
        # ** MIGHT NOT BE NECESSARY **
        

# ** main loop **
def server_loop (id, node):
    intermediate_work_done = True
    all_finished = False
    
    message = "" + str (node.getId())
    iters = 0
    node.getSemaphore().acquire()
    while True:
        # do work
        # get work in byte stream to send
        # get and set message in node
        message = "hello from "+ str(node.getId()) + ", " + str(iters) + " iters in" 
        message = message + " sending to: "
        for neighbor in neighbors (node.getId(), num_procs):
            message = message + str(neighbor) + " "
        
        if (intermediate_work_done):
        
            node.getLock().acquire()
            node.getSemaphore().release()
            node.setMessage (message)
   
            # get neighboring ports for message
            ports = []
            for neighbor in neighbors (node.getId(), num_procs):
                ports.append(port_seed + neighbor)
            node.setMessagePorts (ports)
            
            node.getLock().release()
        # recieve messages from each neighbor
        messages = []
        for i in range(len(neighbors(node.getId(), num_procs))):
            conn, addr = node.getServer().accept()
            messages.append  (conn.recv(BUFFER_SIZE).decode("ascii"))
            print (messages[i])
        node.getSemaphore().acquire()
        # do more work
    
    
        # check if done
        if (iters > 2): #(all_finished)
            node.setIsDone(True)
            node.getSemaphore().release()
            return;
        iters = iters + 1
     
if __name__ == "__main__":
    #### Setup ####

    servers = []
    
    num_procs = 0
    if (len(sys.argv) != 2):
        print ("invalid usage: incorrect number of arguments")
        print ("python run_dgnca <num processes>")
        quit()
    try:
        num_procs = int(sys.argv[1])
        print (num_procs)
    except ValueError:
        print ("invalid usage: please enter a processes count number to a power of 2")
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
    
    print("num connections=" + str(sum))
# now we have num_proc nodes which we use to spawn num_proc*2 threads (or possible more later!)
# which has one thread for the server, and one (or possibly more) for the messanger.
# now we create threads, store them in respective arrays, then start them.
# Work is done on the server thread, which 
# then constructs a string message, uses <string>.encode()
# on the message, locks using the nodes shared lock,
# then passes that into the node object
# using node.setMessage (message).
# after this, the lock is released, the server thread tries to recieve message
# while the worker thread acquires the shared node lock, and sends the message.
    server_threads    = []
    messanger_threads = []
    
    for i in range(len(servers)):
        m = threading.Thread (target=messanger_loop, args=(i,servers[i]))
        messanger_threads.append (m)
        s = threading.Thread (target=server_loop,    args=(i,servers[i]))
        server_threads.append    (s)
    
    # starts threads
    for i in range(len(servers)):
        server_threads[i].start()
        messanger_threads[i].start()
    
    # joins threads and destroys sockets
    for i in range(len(servers)):
        # join threads
        server_threads[i].join()
        messanger_threads[i].join()
        servers[i].getServer().close()
    print ("ending program")

    pass
