require "test/unit"
require_relative "linked_list"

class TestLinkedList < Test::Unit::TestCase
  def test_add_item_to_linked_list
    add_item_instance = LinkedList.new
    add_item_instance.add_item(4)
    assert_equal(4, add_item_instance.head.data)
  end

  def test_remove_item
    remove_item_instance = LinkedList.new
    remove_item_instance.add_item(4)
    remove_item_instance.add_item(5)
    assert_includes(remove_item_instance.remove_item(5), "deleted")
  end

  def test_search_data
    search_item = LinkedList.new
    add_list = [10, 20, 30, 40]
    add_list.each do |value|
      search_item.add_item value
    end
    assert_equal(search_item.search_data(add_list[1]),
      add_list[1])
    assert_not_includes(add_list,
      search_item.search_data(3))
  end
end
