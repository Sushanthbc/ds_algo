 # Stacks

# can be built using arrays / linked list

class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

end

class Stack
  attr_accessor :top, :bottom, :length

  def initialize(limit)
    @top = nil
    @bottom = nil
    @length = 0
    @limit = limit
  end

  def peek
    @top.val unless @length == 0
  end

  def push(val)
    return "Stack Limit Reached" if @length == @limit
    stack = Node.new(val)
    if @bottom.nil?
      @top = stack
      @bottom = stack
    else
      temp_top = @top
      @top = stack
      @top.next = temp_top
    end
    @length += 1
  end

  def pop
    return "Stack Empty" if @length == 0
    unless @top.val.nil?
      @top = @top.next
      @length -= 1
    end

    @bottom = nil if @length == 0
  end

end


stack = Stack.new(10)
stack.peek
