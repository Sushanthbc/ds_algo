require_relative 'queue'
require 'test/unit'
require 'test/unit/ui/console/testrunner'

class TestQueue < Test::Unit::TestCase

  def test_add_item_to_queue
    que = Queue.new(10)
    que.enqueue_item(8)
    assert_equal([8], que.queue)
  end

  def test_remove_item
    que = Queue.new(10)
    que.enqueue_item(8)
    que.dequeue_item(8)
    assert_equal([], que.queue)
  end

  def test_search_item
    queue = Queue.new(10)
    array_list = [2,3,4,51,1,34]
    array_list.each do |i|
      queue.enqueue_item(i)
    end
    assert_includes(true, queue.search_item(4))
    assert_includes(false, queue.search_item(10))
  end

end
