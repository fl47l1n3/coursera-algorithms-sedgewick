import sys


def better_linear_search(A, n, x):
    for i in range(n):
        if A[i] == x:
            return i
    return -1


result = better_linear_search(
    [1, 2, 3, 4, 5, 6, 7],
    7,
    int(sys.argv[1])
)
print(result)
