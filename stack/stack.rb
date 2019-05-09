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
        raise "underflow error"
      else
        popped = @store[@top]
        @store[@top] = nil
        @top = @top.pred
        popped
      end
    end

    def remove_element(element)
      if empty?
        raise "underflow error"
      else
        @store.each_with_index do |ele, idx|
          if ele == element
            popped = @store[idx]
            @store[idx] = nil
            popped
          end
        end
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
