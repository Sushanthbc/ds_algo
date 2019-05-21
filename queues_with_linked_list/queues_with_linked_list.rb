class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end


class Queue
  attr_accessor :start, :end, :length

  def initialize(limit)
      @start = nil
      @end = nil
      @length = 0
      @limit = limit
  end

  def enqueue(val)
    queue = Node.new(val)
    if @start.nil?
      @start = queue
      @end = queue
    else
      @end.next = queue
      @end = queue
    end
    @length += 1
  end

  def dequeue
    unless @start.nil?
      @start = @start.next
      @length -= 1
    end
    @end = nil if @length == 0
  end

  def peek
    @start.val
  end

end
