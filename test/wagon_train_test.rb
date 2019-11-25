require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/node'
require_relative '../lib/wagon_train'

class WagonTrainTest < Minitest::Test

  def test_it_exists
    wt = WagonTrain.new
    assert_instance_of WagonTrain, wt
  end

  def test_it_has_a_list
    wt = WagonTrain.new
    assert_instance_of LinkedList, wt.list
    assert_nil wt.list.head
  end

  def test_can_append
    wt = WagonTrain.new
    node1 = wt.append("Burke")
    assert_instance_of Node, wt.append("Burke")
    assert_equal "Burke", node1.surname
  end

  def test_can_count_nodes
    wt = WagonTrain.new
    assert_equal 0, wt.count
    wt.append("Burke")
    assert_equal 1, wt.count
    wt.append("Chapman")
    assert_equal 2, wt.count
    wt.append("Lawson")
    assert_equal 3, wt.count
  end
end
