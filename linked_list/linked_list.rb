class LinkedList
  class Node
    attr_accessor :data, :next  
    def initialize(data)
      @data = data
      @next = nil
    end
  end
  
  attr_reader :head, :tail, :length  

  def initialize
    @head = nil
    @tail = nil
    @length = 0 
  end

  def add_item(data)
    node = Node.new data
    unless @head.nil?
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail = node
    end
    @length = @length + 1
  rescue StandardError => e
    puts e
  end
 
  def remove_item(data)
  end 
end

