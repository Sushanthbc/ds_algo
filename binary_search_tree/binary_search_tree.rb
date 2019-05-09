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
        prev.left = current
      elsif side == "right" && prev != nil
        prev.right = current
      end
      return data
    end
    if current.data < data
      add_items(data, current.right, current, "right")
    else
      add_items(data, current.left, current, "left")
    end
  end

  def search_item(data, current)
  end
end
