class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
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
    raise "We cannot delete empty linked list" if @head == nil
    current = prev = @head
    while current
      if current.data == data
        if current.next != nil
          prev = current
          current = current.next
        else
          prev.next = nil
        end
        @length -= 1
        return "Item is deleted from linked: " + data.to_s
      end
      prev = current
      current = current.next
    end
   end

  def search_data(data)
  	raise "We cannot delete empty linked list" if @head == nil
  	current = @head
 	while current
		return "element exists" if current.data == data
  	end
  	"can't find data in linked list"
  end

end

class DisplayLinkedList
	
	def initialize(node)
		@node = node
	end
	
	def output
		res = ""
		while !@node.next.nil?
			res += @node.data.to_s + "-->"
			@node = @node.next
		end
		res+@node.data.to_s
	end

end
