require 'byebug'
class Solution
    # @param a : array of array of integers
    # @param b : integer
    # @return an integer
    
    def range_direction(ind, val)
        if @arr[ind][0] <= val && val <= @arr[ind][-1]
            0
        elsif val > @arr[ind][-1]
            1
        else
            -1
        end
    end
    
    def value_direction(ind, val)
        val <=> @arr[@range_ind][ind]
    end
    
    def search(low, high, val, method)
        
        puts "#{low} #{high} #{val} #{method}"
        mid = low + (high - low) / 2
        direction = self.send(method, mid, val)
        return mid if direction == 0
        return -1 unless low < high
        return search(mid + 1, high, val, method) if mid == low
        return search(mid, high - 1, val, method) if mid == high 
        
        if direction == 1
            return search(mid, high, val, method)
        else direction == -1
            return search(low, mid, val, method)        
        end
    end
    :
    def searchMatrix(a, b)
       @arr = a
       @range_ind = search(0, a.length - 1, b, "range_direction")
       return 0 if @range_ind == -1
       return 0 if search(0, a[@range_ind].length - 1, b, "value_direction") == -1
       return 1
    end
end

puts Solution.new.searchMatrix([[1,2,3],[4,5,6]], 5)
puts Solution.new.searchMatrix([
  [3],
  [29],
  [36],
  [63],
  [67],
  [72],
  [74],
  [78],
  [85],
], 41)
