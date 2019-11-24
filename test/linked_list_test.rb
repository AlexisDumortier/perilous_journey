require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/node'

class LinkedListTest < Minitest::Test

  def test_it_has_a_head
    list = LinkedList.new
    assert_nil list.head
  end

  def test_appends_returns_a_node
    list = LinkedList.new
    node = list.append("West")
    assert_instance_of Node, node
    assert_equal "West", node.surname
    assert_nil node.next_node
  end

  def test_it_has_a_count_of_nodes
    list = LinkedList.new
    assert_equal 0, list.count
    list.append("West")
    assert_equal 1, list.count
  end

  def test_it_can_print_name_of_node
    list = LinkedList.new
    list.append("West")
    assert_equal "The West family", list.to_string
  end

end
