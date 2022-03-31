import socket
import threading
import math
from collections import namedtuple


# node object, done to help with inter-processes
# communication between messanger and server thread
class Node:
    # takes in the server socket, the proccess id, port #, 
    # number of total processes, 
    # and a lock which is shared between messanger and server threads
    def __init__(self, server, id, port, num_proc, lock):
        self.id = id
        self.server = server
        self.port = port
        self.num_proc = num_proc
        self.messanger = -1
        self.has_message = False
        self.message = ""
        self.message_ports = []
        self.lock = lock
        self.is_done = False
        # hashtable to get socket with id as key
        self.communicators = {}

    # largely depreciated
    # ***
    Communicator = namedtuple ("socket", "id")
    def addCommunicator (self, communicator, id):
        self.communicators[id] = communicator
    # ***
    
    # sends message to single port
    # spins up new socket every time, not sure if this what do
    def sendMessage (self, message, port):
        self.messanger = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.messanger.connect(('localhost', port))
        sock.sendall(bytes(message, 'ascii'))
        
    # checks if has_message flag has been raised
    def hasMessage (self):
        return self.has_message
        
    # cleans up node from sending messages
    def finishedMessages (self):
        self.message = ""
        self.has_message = False
    

    # set ports for message to receive
    def setMessagePorts (self, ports):
        message_ports = ports
    
    # sets is_done flag, communicates to 
    # messangers that work is done
    def setIsDone (self, is_done):
        is_done = is_done
        
    
    # input message should use <string>.encode()
    # also sets has_message flag
    def setMessage (self, message):
        self.message = message
        self.has_message = True
        # getters
    def getMessagePorts (self):
        return self.message_ports
    def getServer (self):
        return self.server
    def getCommunicator (self, id):
        return self.communicators[id]
    def getCommunicators (self):
        return self.communicators
    def getLock(self):
        return self.lock()
    def getPort (self):
        return self.port
    def getMessage (self):
        return self.message
    def getId (self):
        return self.id
        
        
        
#Things to currently improve on!
#   1. Stop busy waiting and use semaphores / equivelent to signal instead
#   2. Figure out what is optimal for socket spawning
#       a) aka figure if better to spawn at start and store, or spawn with each message