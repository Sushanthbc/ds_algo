require "test/unit"
require_relative "binary_search_tree"

class TestBinarySearchTree < Test::Unit::TestCase
  def test_add_to_binary_tree
    items = BinarySearchTree.new
    [10, 2, 5, 20].each {|x| items.add_items(x, items.root)}
    assert_equal(20, items.root.right.data)
    assert_equal(2, items.root.left.data)
    assert_equal(5, items.root.left.right.data)
  end
end
