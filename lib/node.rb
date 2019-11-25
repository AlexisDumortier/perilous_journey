class Node

  attr_reader :surname, :supplies
  attr_accessor :next_node

  def initialize(name, supplies)
    @surname = name
    @next_node = nil
    @supplies = supplies
  end

end
