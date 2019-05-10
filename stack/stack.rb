  class Stack
    attr_accessor :top
    def initialize(size)
      @size = size
      @store = Array.new(@size)
      @top = -1
    end

    def push(element)
      if full?
        raise "overflow error"
      else
        @top += 1
        @store[@top] = element
      end
    end

    def pop
      if empty? or @store.nil?
        raise "underflow error"
      else
        popped = @store[@top]
        @store[@top] = nil
        @top = @top.pred
        popped
      end
    end

    def remove_element(element)
      raise "underflow error" if empty?
      until(@top == -1)
        if @store[@top] == element
          pop
          break
        end
        pop
      end
    end

    private

    def empty?
      @top == -1
    end

    def full?
      @top == (@size  - 1)
    end
  end
