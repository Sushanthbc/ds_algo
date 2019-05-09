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
      if empty?
        raise "underflow error"
      else
        deletion_index = nil
        @store.each_with_index do |ele, idx|
          if ele == element
            deletion_index = idx
            break
          end
        end
        (@top - deletion_index + 1).times do |i|
          pop
        end
        return element
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
