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

  def add_items(data, current, prev=nil, side=nil)
    if current.nil?
      current = TreeNode.new(data)
      @root = current if @root.nil?
      if side == "left" && prev != nil
        prev.right = current
      elsif side == "right" && prev != nil
        prev.left = current
      end
      return data
    end
    if current.data < data
      add_items(data, current.right, current, "left")
    else
      add_items(data, current.left, current, "right")
    end
  end
end
