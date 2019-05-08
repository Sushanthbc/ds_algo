class TreeNode
  attr_accessor :data, :right, :left
  def initialize(data)
    @data =  data
    @right = nil
    @left = nil
  end
end

class TreeError < StandardError
end

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def add_items(data, current)
    current = @root
    if current.nil || current.right == nil || current.left == nil
      current = TreeNode.new(data)
      return data
    end
    if current.data > data
      add_items(data, current.right)
    else
      add_items(data, current.left)
    end
  end
end
