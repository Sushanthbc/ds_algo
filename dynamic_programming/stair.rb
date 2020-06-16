class Solution:
    # @param A : integer
    # @return an integer
    def climbStairs(self, A):
        arr = []
        arr += [1,1]
        if(A < 1):
            return arr[A+1]
        for i in range(2, A+1):
            arr.append(arr[i-1] + arr[i - 2])
        return arr[-1]
                
