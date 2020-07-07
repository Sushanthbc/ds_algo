class Solution:
    # @param A : list of list of integers
    # @return the same list modified
    def rotate(self, A):
        for i in range(len(A)):
            for j in range(i):
                A[i][j], A[j][i] = A[j][i], A[i][j]
        return [a[::-1] for a in A]
A = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
sol = Solution()
print(sol.rotate(A))
