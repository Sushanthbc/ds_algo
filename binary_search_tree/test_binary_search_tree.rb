require "test/unit"
require_relative "binary_search_tree"

class TestBinarySearchTree < Test::Unit::TestCase
  def test_add_to_binary_tree
    items = BinarySearchTree.new
    [10, 2, 5, 20].each {|x| items.add_items(x)}
    assert_equal(20, items.root.right.data)
    assert_equal(2, items.root.left.data)
    assert_equal(5, items.root.left.right.data)
  end

  def test_duplicate_data
    items = BinarySearchTree.new
    [10, 10, 10].each {|x| items.add_items(x)}
    assert_equal("Duplicates are not allowed", items.add_items(10))
    assert_nil(items.root.right&.data)
    assert_nil(items.root.left&.data)
    assert_nil(items.root.left&.light&.data)
    assert_nil(items.root.right&.left&.data)
  end

  def test_search_empty_tree
    items = BinarySearchTree.new
    assert_equal("tree is empty", items.search_item(10))
  end

  def test_search_item_in_tree
    items = BinarySearchTree.new
    [10, 20, 5].each {|x| items.add_items(x)}
    assert_equal(5, items.search_item(5))
  end
end
