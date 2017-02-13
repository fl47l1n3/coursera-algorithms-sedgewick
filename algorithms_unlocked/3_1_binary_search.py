import sys


def binary_search(A, n, x):
    p = 0
    r = n - 1

    while p <= r:
        q = (p + r) / 2
        if A[q] == x:
            return q
        elif A[q] > x:
            r = q - 1
        elif A[q] < x:
            p = q + 1

    return -1


result = binary_search(
    [1, 2, 3, 4, 5, 6, 7],
    7,
    int(sys.argv[1])
)
print(result)
