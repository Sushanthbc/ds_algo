class Queue
  attr_accessor :front, :rear, :queue, :size

  def initialize(size)
    @front = @rear = -1
    @queue = []
    @size = size
  end

  def enqueue_item(item)
    if @queue.empty?
      @rear = @front = 0
    elsif @size == @rear
      raise "Cann't insert element because Queue is full."
    else
      @rear += 1
    end
    @queue << item
  end

  def dequeue_item
    if @queue.empty?
      raise "Queue is empty"
    else
      (0..(@rear-1)).each do |i|
        @queue[i] = @queue[i+1]
      end
      @queue.delete_at(@rear)
      @rear = @rear-1
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
