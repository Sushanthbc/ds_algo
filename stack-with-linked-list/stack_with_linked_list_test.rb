require "test/unit"
require_relative "stacks_with_linked_list"

class TestStacks < Test::Unit::TestCase

  def test_push
    stack = Stack.new(2)
    stack.push(10)
    assert_equal(stack.top.val, 10)
  end

  def test_pop
    stack = Stack.new(3)
    [10, 20, 30].each{|x| stack.push(x)}
    stack.pop
    assert_equal(stack.top.val, 20)
  end

  def test_peek
    stack = Stack.new(3)
    [10, 20, 30].each{|x| stack.push(x)}
    assert_equal(stack.peek, 30)
  end

  def test_check_for_limit
    stack = Stack.new(2)
    [10, 20].each{|x| stack.push(x)}
    assert_equal(stack.push(30), "Stack Limit Reached")
  end

  def test_pop_empty_list
    stack = Stack.new(2)
    stack.pop
  end
end
