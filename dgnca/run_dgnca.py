import socket
import threading
import time
import math
import sys
from node import Node

#shameless ripped from python docs
#class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):

#    def handle(self):
#       data = str(self.request.recv(1024), 'ascii')
#        cur_thread = threading.current_thread()
#        response = bytes("{}: {}".format(cur_thread.name, data), 'ascii')
#        self.request.sendall(response)

#class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
#    pass

def client (ip, port, message, wait, rank, num_procs, s_time):
    # simulate computation
    time.sleep (wait)
    print (str(time.time()-s_time-wait) +"\n"+ str(rank) + " "+ str(neighbors (rank, num_procs)))
    print ()
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.connect((ip, port))
        sock.sendall(bytes(message, 'ascii'))
        response = str(sock.recv(1024), 'ascii')
        print("Received: {}".format(response))
        
        
# returns int arr of all neighboring ranks
# assumes # of procs is pow of 2
# and neighbors are what they are in a log2(n)xlog2(n) array
# diagonals are not neighbors
def neighbors (rank, num_proc):
    neighbors = []
    base = math.floor (math.log2 (num_proc))
    if (rank % base != 0):
        neighbors.append (rank-1)
    if (rank % base != base-1):
        neighbors.append (rank+1)
    if (rank - base >= 0):
        neighbors.append (rank - base)
    if (rank + base < num_proc):
        neighbors.append (rank + base)
    return neighbors
     
if __name__ == "__main__":
    #### Setup ####
    host = 'localhost'
    port_seed = 5789
    servers = []
    
    num_procs = int(sys.argv[1])
    print (num_procs)
    if (len(sys.argv) > 2 and math.log2(num_procs) % 2 != 0):
        print ("invalid usage: please enter a processes count to a power of 2")
        quit()


    for i in range (num_procs):
        server = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
        # binds servers in consective ports
        server.bind ((host, port_seed + i))
        print ("server " + str(i) + " created")
        server.listen (num_procs)
        #servers.append (server)
        server_node = Node (server, i, port_seed+i, num_procs)
        servers.append (server_node)
        
        
    #for i in range (num_procs):
        
    # load model
    # load data

    # set up server
    #server = ThreadedTCPServer ((host, port), ThreadedTCPRequestHandler)
    
    
    # create client proccesses to recieve data 
    # send rank as message
#   
    # use rank to choose data to use
    # connect to neighbors using rank
        
    ### Main loop ###
 #   to_stop = False
  #  while (to_stop != False):
        #   Compute update
        
        #   Check for stop signal
  #      if (True):
   #         toStop = false
        #   Broadcast update using tcp
            # server recieves update first -> then broadcasts
            # OR each proc gets its own server
            # and communicates strictly with neighbors
        #   Check for stop signal
        #   Retrieve update from tcp buffer
        #   Update data buffer
    #server.shutdown()
    pass


