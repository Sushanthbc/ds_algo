require "test/unit"
require_relative "stack"

class TestStack < Test::Unit::TestCase

  def test_add_item_to_stack
    size= Stack.new(2)
    item = size.push(6)
    item = size.push(7)
    assert_equal(1,item)
  end

  def test_check_overflow
    size= Stack.new(1)
    item = size.push(6)
    assert_raise RuntimeError do
      item = size.push(9)
    end
  end

  def test_remove_item_to_stack
    size= Stack.new(2)
    item = size.push(6)
    item = size.push(7)
    size.pop
    assert_equal(1,item)
  end

  def test_check_underflow
    size= Stack.new(1)
    item = size.push(6)
    size.pop
    assert_raise RuntimeError do
      size.pop
    end
  end

  def test_remove_selected_item
    size= Stack.new(3)
    item = size.push(6)
    item = size.push(4)
    item = size.push(5)
    size.remove_element(4)
    assert_equal(2,item)
  end

end
