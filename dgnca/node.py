import socket
import threading
import math
from collections import namedtuple

class Node:
    def __init__(self, server, rank, port, num_proc):
        self.rank = rank
        self.server = server
        self.port = port
        self.num_proc = num_proc
        # hashtable to get socket with rank as key
        self.communicators = {}

    Communicator = namedtuple ("socket", "rank")
    def addCommunicator (self, communicator, rank):
        self.communicators[rank] = communicator
    
    def getPort (self):
        return self.port
    
    def getCommunicator (rank):
        return communicators[rank]
    