class Solution:
    # @param A : list of integers
    # @param B : integer
    # @return an integer
    def coinchange2(self, A, B):
        m = 1000007
        n = len(A)
        arr = [0 for i in range(B + 1)]
        arr[0] = 1
        for i in range(1, n):
            j = A[i - 1]
            while(j <= B):
                arr[j] += arr[j - A[i - 1]] % m
                j += 1
        print(arr)
        return (arr[B] + 1) % m
A = [ 18, 24, 23, 10, 16, 19, 2, 9, 5, 12, 17, 3, 28, 29, 4, 13, 15, 8 ]
B = 458
test = Solution()
print(test.coinchange2(A,B))