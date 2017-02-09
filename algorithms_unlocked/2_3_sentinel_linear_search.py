import sys


def sentinel_linear_search(A, n, x):
    last = A[n - 1]
    A[n - 1] = x

    i = 0
    while A[i] != x:
        i += 1

    A[n - 1] = last
    if i < n - 1 or A[n - 1] == x:
        return i
    else:
        return -1


result = sentinel_linear_search(
    [1, 2, 3, 4, 5, 6, 7],
    7,
    int(sys.argv[1])
)
print(result)
