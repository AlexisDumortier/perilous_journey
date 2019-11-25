require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/node'

class LinkedListTest < Minitest::Test

  def test_it_has_a_head
    list = LinkedList.new
    assert_nil list.head
  end

  def test_append_returns_a_node
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
    list.append("Hardy")
    assert_equal 2, list.count
  end

  def test_it_can_print_name_of_node
    list = LinkedList.new
    list.append("West")
    assert_equal "The West family", list.to_string
    list.append("Hardy")
    assert_equal "The West family, followed by the Hardy family", list.to_string

  end

  def test_can_append_multiple_nodes
    list = LinkedList.new
    node1 = list.append("Rhodes")
    assert_equal node1, list.head
    assert_nil list.head.next_node
    node2 = list.append('Hardy')
    assert_equal node2, list.head.next_node
  end

  def test_can_prepend_node
    list = LinkedList.new
    node1 = list.append("Brooks")
    node2 = list.append("Henderson")
    node0 = list.prepend("McKinney")
    assert_instance_of Node, node0
    assert_equal node0, list.head
    assert_equal node1, list.head.next_node
    assert_equal node2, node1.next_node
  end

  def test_can_insert_node
    list = LinkedList.new
    node1 = list.append("Brooks")
    node2 = list.append("Henderson")
    node3 = list.insert(1, "Lawson")
    assert_equal node1, list.head
    assert_equal node3, list.head.next_node
    assert_equal node2, node3.next_node
  end

end
