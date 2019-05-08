class Stack
  def initialize(size)
    @size = size
    @store = Array.new(@size)
    @top = -1
  end

  def push(element)
    if full?
      raise "overflow error"
    else
      @store[@top] = element
    end
    @top += 1
  end

  def pop
    if empty? or @store.nil?
      p "empty"
    else
      @store.pop
    end
    @top -= 1
  end


  private
    def empty?
      @top == -1
    end

    def full?
      @top == (@size  - 1)
    end
end
