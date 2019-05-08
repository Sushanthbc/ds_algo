class TreeNode
  def initialize(data)
    @data =  data
    @right = nil
    @left = nil
  end
end

class TreeError < StandardError
end

class BinarySearchTree
  def add_items(arr)
    return "list is empty" unless arr.empty?
    arr.each do |val|
      
    end
  end
end
