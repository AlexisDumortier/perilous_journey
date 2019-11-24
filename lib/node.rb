class Node

  attr_reader :surname, :next_node

  def initialize(name)
    @surname = name
    @next_node = nil
  end

end
