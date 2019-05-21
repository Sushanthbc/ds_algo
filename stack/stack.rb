  class Stack
    attr_accessor :top
    def initialize(size)
      @size = size
      @store = Array.new(@size)
      @top = -1
    end

    def push(element)
        return "overflow error" if is_full?
        @top += 1
        @store[@top] = element
    end

    def pop
        return "underflow error"  if is_empty? or @store.nil?
        popped = @store[@top]
        @store[@top] = nil
        @top = @top.pred
        popped
    end

    def remove_element(element)
      return "underflow error" if is_empty?
      until(@top == -1)
        if @store[@top] == element
          pop
          break
        end
        pop
      end
    end

    private

    def is_empty?
      @top == -1
    end

    def is_full?
      @top == (@size  - 1)
    end
  end
