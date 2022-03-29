import socket
import _thread
import sys
if __name__ == "__main__":


    #### Setup ####
    # set up main server proc
    num_connections = 2
    port = 5789
    print (str(sys.argv))
    # either create a script to run multiple times
    # taking input as seed or find way to parallelize
    # this explicit portion to have each socket set up
    # i think?
    #for i in range (num_connections):
    #    lis = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
     #   lis.connect (('localhost', port))
      #  msg = ("Hello from socket " + str(i))
       # lis.send (msg.encode())
        #print ("sent: " + str(msg.encode()))
        #msg = (lis.recv (48)).decode()
        #print ("receved: " + msg)
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
    
