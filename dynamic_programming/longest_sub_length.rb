class Solution
    # @param a : constant array of integers
    # @return an integer
    def longestSubsequenceLength(a)
        inc_arr = a.map {|val| 1}
        dec_arr = a.map {|val| 1}
        length = a.length
        return 1 if a.length == 1
        length.times do |i|
            j = i -1
            k = length - i - 1
            l = k + 1
            while j > -1 do
                inc_arr[i] = [inc_arr[j] + 1, inc_arr[i]].max if a[j] < a[i]
                j -= 1
            end
            while l < length do 
                dec_arr[k] = [dec_arr[l] + 1, dec_arr[k]].max if a[l] < a[k]
                l += 1
            end
        end
        sum = 1
        length.times do |ind|
            sum = [sum, inc_arr[ind] + dec_arr[ind]].max
        end
        return sum - 1
    end 
end

