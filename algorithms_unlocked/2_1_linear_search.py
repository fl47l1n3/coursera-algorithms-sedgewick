import sys


def linear_search(A, n, x):
    answer = -1
    for i in range(n):
        if A[i] == x:
            answer = i
    return answer


result = linear_search(
    [1, 2, 3, 4, 5, 6, 7],
    7,
    int(sys.argv[1])
)
print(result)
