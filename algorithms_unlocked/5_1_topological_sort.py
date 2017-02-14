

def topological_sort(G, n):
    in_degree = [0] * n
    next_ = []
    result = []

    for u, vv in G:
        for v in vv:
            if v:
                in_degree[v - 1] += 1

    for u, vv in G:
        if in_degree[u - 1] == 0:
            next_.append(u)

    while len(next_) != 0:
        u = next_.pop()
        vv = G[u - 1][1]
        result.append(u)

        for v in vv:
            if v:
                in_degree[v - 1] -= 1
                if in_degree[v - 1] == 0:
                    next_.append(v)

    return in_degree, next_, result


G = [
    # (u, (v1, v2, ...))
    (1, (3, )),
    (2, (4, )),
    (3, (4, 5)),
    (4, (6, )),
    (5, (6, )),
    (6, (7, 11)),
    (7, (8, )),
    (8, (13, )),
    (9, (10, )),
    (10, (11, )),
    (11, (12, )),
    (12, (13, )),
    (13, (14, )),
    (14, (None, )),
]

result = topological_sort(G, len(G))
print(result)
