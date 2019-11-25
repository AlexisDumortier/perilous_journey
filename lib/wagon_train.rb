require_relative 'linked_list'


class WagonTrain

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(name)
    self.list.append(name)
  end

  def count
    self.list.count
  end

end
