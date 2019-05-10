require "test/unit"
require_relative "stack"

class TestStack < Test::Unit::TestCase

  def test_add_item_to_stack
    size = Stack.new(2)
    item = [6,7].each {|x| size.push(x)}
    p size
    assert_equal([6,7], item)
  end

  def test_check_overflow
    size = Stack.new(1)
    item = size.push(6)
    p item
    assert_includes(size.push(9), "overflow error")
  end

  def test_remove_item_to_stack
    size = Stack.new(2)
    item = [6,7].each {|x| size.push(x)}
    item.pop
    assert_equal([6],item)
  end

  def test_check_underflow
    size = Stack.new(1)
    item = size.push(6)
    size.pop
    assert_includes(size.pop, "underflow error")
  end

  def test_remove_selected_item
    size = Stack.new(3)
    [6,4,5].each {|x| size.push(x)}
    size.remove_element(4)
    assert_equal(size.top, 0)
  end

  def test_selective_removing_leaving_behind
    items = Stack.new(4)
    [10, 20, 30, 40].each {|x| items.push(x)}
    items.remove_element(20)
    # we don't have top attr_accessor
    assert_equal(items.top, 0)
  end

  def test_empty_pop
    items = Stack.new(2)
    items.remove_element(10)
  end

end
