import socket
import sys

from _thread import *
import threading


port = 2000
host = 'localhost'
print_lock = threading.Lock()

def threaded(client):
    while True:
        data = client.recv(1024)
        if not data:
            print('Connection terminated')

            #print_lock.release()
            break
        
        print(f'Server Received {data}')
        
        # Send back something to client
        returnMessage = 'Recieved from client: ' + str(data.decode('ascii'))[-1] 
        client.send( returnMessage.encode('ascii'))
    
    client.close()


if __name__ == "__main__":

    #### Setup ####

    # Creating Main Server
    mainServer = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    mainServer.bind((host, port))
    mainServer.listen()
    print("Listening on", (host, port))

    # Event Loop
    try:
        while True:
            # accept connection from client
            client, addr = mainServer.accept()

            #print_lock.acquire()
            print(f'Connected to: {addr[0]}:{addr[1]}')

            start_new_thread(threaded, (client,))
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
    
