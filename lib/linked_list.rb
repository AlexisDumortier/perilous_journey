require_relative './node'

class LinkedList

  attr_reader :head, :count

  def initialize
    @head = nil
  end

  def count
    if self.head == nil
      return 0
    else
      temp_node = self.head
      count = 1
      while temp_node.next_node != nil
        count += 1
        temp_node = temp_node.next_node
      end
      count
    end
  end

  def append(name)
    @head = Node.new(name)
  end

  def to_string
    "The #{@head.surname} family"
  end

end
