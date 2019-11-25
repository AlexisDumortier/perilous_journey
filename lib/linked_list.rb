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
    if @head == nil
      @head = Node.new(name)
    else
      temp_node = self.head
      while temp_node.next_node != nil
        temp_node = temp_node.next_node
      end
      temp_node.next_node = Node.new(name)
    end
  end

  def to_string
    if @head == nil
      list_string = ""
    else
      list_string = "The #{@head.surname} family"
      temp_node = self.head
      while temp_node.next_node != nil
        list_string = list_string + ", followed by the #{temp_node.next_node.surname} family"
        temp_node = temp_node.next_node
      end
    end
    list_string
  end

end
