class RodCut:
    def max_profit(n, prices):
      arr = [prices[i] for i in range(n)]
      for i in range(len(arr)):
        for j in range(int(i/2)):
          arr[i] = max(arr[j] + arr[i - j - 1], arr[i])
      return arr[-1]
# 1 4 6 8 15 17 18
print(RodCut.max_profit(8, [1, 4, 6, 7, 10, 17, 15, 20]))