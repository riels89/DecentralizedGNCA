import socket
from node import Node

import threading

host = 'localhost'
port = 2000

def createClient(id):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    # Connecting to the socket
    sock.connect((host, port))

    # Sending a message
    myNode = Node (host, id, port, 3, None, None)
    sendCount = 1
    
    while sendCount < 6:
        message = f'Node: {myNode.getId()}, sent: {sendCount}'
        sock.send(message.encode('ascii'))

        data = sock.recv(1024)

        print(f"Received from server: {str(data.decode('ascii'))}")
        sendCount += 1
    
    sock.close()

if __name__ == "__main__":
    num_procs = 2
    
    threads = []
    for i in range(num_procs):
        thread = threading.Thread (target = createClient, args=(i,))
        threads.append(thread)
        thread.start()
    
    for thread in threads:
        thread.join()
    
    print(f'Created: {len(threads)} clients')

    for thread in threads:
        thread.join()
    
    print(f'Closed: {len(threads)} clients')

