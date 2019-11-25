require_relative 'linked_list'


class WagonTrain

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(name, supply)
    self.list.append(name, supply)
  end

  def count
    self.list.count
  end

  def supplies
    temp_node = self.list.head
    total_supply = Hash.new(0)
    while temp_node.next_node != nil
      temp_node.supplies.keys.each do |key|
      total_supply[key] += temp_node.supplies[key]
      end
      temp_node = temp_node.next_node
    end
    temp_node.supplies.keys.each do |key|
    total_supply[key] += temp_node.supplies[key]
    end
    total_supply
  end

end
