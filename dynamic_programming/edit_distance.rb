class Solution:
    # @param A : string
    # @param B : string
    # @return an integer
    def minDistance(self, A, B):
        n = len(A)
        m = len(B)
        mat = [[0 for i in range(m + 1)] for i in range(n + 1)]
        for i in range(n+1):
            for j in range(m+1):
                if(i == 0):
                    mat[i][j] = j
                elif(j == 0):
                    mat[i][j] = i
                elif(A[i - 1] == B[j - 1]):
                    mat[i][j] = mat[i - 1][j - 1]
                else:
                    mat[i][j] = 1 + min(mat[i - 1][j], mat[i][j - 1], mat[i - 1][j - 1])
        return mat[n][m]
