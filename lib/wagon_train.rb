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

  def go_hunting
    hunt = {'squirrel' => rand(5), 'deer'=> rand(5), 'bison' => rand(5)}
    hunt_load = hunt['squirrel']*2 + hunt['deer']*40 + hunt['bison']*100
    self.list.head.supplies["pounds of food"] += hunt_load

    puts "You got #{hunt['squirrel']} squirrel#{'s' if hunt['squirrel'] > 1}," \
    " #{hunt['deer']} deer#{'s' if hunt['deer'] > 1} and #{hunt['bison']}" \
    " bison#{'s' if hunt['bison'] > 1} for #{hunt_load} "\
    "pound#{'s' if hunt_load > 1} of food"
  end
end
