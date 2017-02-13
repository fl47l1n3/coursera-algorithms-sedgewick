import sys


def recursive_linear_search(A, n, i, x):
    if i >= n:
        return -1

    if A[i] == x:
        return i
    else:
        return recursive_linear_search(A, n, i + 1, x)


result = recursive_linear_search(
    [1, 2, 3, 4, 5, 6, 7],
    7,
    0,
    int(sys.argv[1])
)
print(result)
