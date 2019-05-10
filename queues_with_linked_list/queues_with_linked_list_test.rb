require "test/unit"
require_relative "queues_with_linked_list"

class TestQueues < Test::Unit::TestCase

  def test_enqueue
    queue = Queue.new(10)
    queue.enqueue(10)
    assert_equal(queue.end.val, 10)
  end

  def test_dequeue
    queue = Queue.new(10)
    queue.enqueue(10)
    queue.enqueue(20)
    queue.dequeue
    assert_equal(queue.start.val, 20)
  end

  def test_limit
    queue = Queue.new(2)
    queue.enqueue(10)
    queue.enqueue(20)
    assert_equal(queue.enqueue(30), "Stack limit reached")
  end

  def test_peek
    queue = Queue.new(10)
    queue.enqueue(10)
    queue.enqueue(20)
    assert_equal(queue.peek, 10)
  end

end
