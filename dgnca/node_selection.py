import numpy as np



def select_node(adjacency):
    adjacency = np.copy(adjacency)

    n, _ = adjacency.shape
    ids = list(range(n))
    id_set = set(ids)
    neighbors = {i:np.where(adjacency[i])[0] for i in ids}
    node_order = []

    while len(ids) > 0 and np.any(adjacency):
        curr_nodes = []
        while(len(id_set) > 0):
            curr_id = id_set.pop()

            curr_nodes.append(curr_id)

            for neighbor in neighbors[curr_id]:
                if neighbor in id_set:
                    id_set.remove(neighbor)

        node_order.append(curr_nodes)
        for id in curr_nodes:
            adjacency[id] = 0
            adjacency[:, id] = 0
            ids.remove(id)

        id_set = set(ids)

    return node_order


if __name__ == "__main__":
    adj = np.array([[0, 1, 1, 0],
                    [1, 0, 1, 1],
                    [1, 1, 0, 1],
                    [0, 1, 1, 0]])
    order = select_node(adj)
    print(order)

    adj = np.array([[0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                    [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
                    [0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
                    [1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0],
                    [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
                    [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0],
                    [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]])
    order = select_node(adj)
    print(order)

    adj = np.array([[0, 1, 1, 0, 0, 0, 0],
                    [1, 0, 1, 0, 0, 1, 1], 
                    [1, 1, 0, 1, 1, 0, 0], 
                    [0, 0, 1, 0, 1, 0, 0], 
                    [0, 0, 1, 1, 0, 1, 0], 
                    [0, 1, 0, 0, 1, 0, 1], 
                    [0, 1, 0, 0, 0, 1, 0]])
    order = select_node(adj)
    print(order)

    import pygsp
    g = pygsp.graphs.Grid2d()
    adj = np.squeeze(np.asarray(g.W.todense()))
    print(select_node(adj))

        



