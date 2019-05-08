class Queue

  attr_accessor :front, :rear

  def initialize
    @front = @rear = 0
    @queue = []
  end

  def enqueue_item(item)
    unless @queue.empty?
      @rear += 1
    end
    @queue << item
  end

  def dequeue_item
    if @queue.empty?
      raise "Queue is empty"
    else
      @rear -= 1
    end
    @queue
  end

  def search_item(item)
    if @queue.empty?
      raise "Queue is empty"
    else
      if @queue.include? item
        return true 
      else
        return false
      end
    end
  end

end
