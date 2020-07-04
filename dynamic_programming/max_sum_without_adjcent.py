class Solution:
    # @param A : list of list of integers
    # @return an integer
    def adjacent(self, A):
        max_len = len(A[0])
        if max_len == 1:
            return max(A[0][0], A[0][1])
        max_a = [0 for i in range(max_len)]
        max_a[0] = max(A[0][0], A[1][0])
        max_a[1] = max(A[0][1], A[1][1])
        last_max = max_a[1]
        for i in range(2, max_len):
            curr = max(A[0][i], A[1][i])
            if i % 2 == 0:
                max_a[i] = max((max_a[i - 1] - last_max + curr), (max_a[i - 2] + curr))
            if i % 2 == 1:
                max_a[i] = max((max_a[i - 1] - last_max + curr), (max_a[i - 2] + curr))
            last_max = curr

        return max(max_a)

# A = [
#   [16,  5, 54, 55, 36, 82, 61, 77, 66, 61],
#   [31, 30, 36, 70,  9, 37,  1, 11, 68, 14]
# ]

# [31, 30, 54,  70,  36,  82,  61,  77, 66, 61]
# [31, 30, 85, 101, 121, 183, 182, ]
# A = [[31, 83, 65, 30, 15],
#      [66, 89, 0, 43, 15]]
A = [[74, 37, 82, 1], [66, 38, 16, 1]]
goal = Solution()

print(goal.adjacent(A))