require_relative 'queue'
require 'test/unit'
require 'test/unit/ui/console/testrunner'

class TestQueue < Test::Unit::TestCase
  def test_add_item_to_queue
    queue = Queue.new
    queue.enqueue_item(8)
    assert_equal(8, queue.rear)
  end

  def test_remove_item
    queue = Queue.new
    queue.enqueue_item(8)
    queue.dequeue_item(8)
    assert_equal(8, queue.rear)
  end

  def test_search_item
    queue = Queue.new
    array_list = [2,3,4,51,1,34]
    array_list.each do |i|
      queue.enqueue_item(i)
    end
    assert_includes(array_list, queue.search_item(4))
    assert_includes(array_list, queue.search_item(10))
  end
end
