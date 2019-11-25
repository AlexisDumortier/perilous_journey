require_relative './node'

class LinkedList

  attr_reader :count
  attr_accessor :head

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

  def append(name, supply)
    if @head == nil
      @head = Node.new(name, supply)
    else
      temp_node = self.head
      while temp_node.next_node != nil
        temp_node = temp_node.next_node
      end
      temp_node.next_node = Node.new(name, supply)
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

  def prepend(name, supply)
    temp = @head
    @head = Node.new(name, supply)
    @head.next_node = temp
    @head
  end

  def insert(pos, name, supply)
    if pos == 0
      self.prepend(name, supply)
    elsif pos == count
      self.append(name, supply)
    elsif pos < count
      temp = self.head
        (pos-1).times do
          temp = temp.next_node
        end
      insert_next_node = temp.next_node
      temp.next_node = Node.new(name, supply)
      temp.next_node.next_node = insert_next_node
      temp.next_node
    else
      puts "can not insert beyond the tail"
    end

  end

  def access_node(node_index)
    temp_node = self.head
    node_index.times do
      temp_node = temp_node.next_node
    end
    temp_node
  end

  def find(pos, num)
    temp_node = self.access_node(pos)
    list_string = "The #{temp_node.surname} family"
    [num-1, self.count-pos-1].min.times do
      list_string = list_string + ", followed by the #{temp_node.next_node.surname} family"
      temp_node = temp_node.next_node
    end
    list_string
  end

  def includes?(name)
    temp_node = self.head
    while temp_node.next_node != nil
      if (temp_node.surname == name) || (temp_node.next_node.surname == name)
        return true
      end
      temp_node = temp_node.next_node
    end
      return false
  end

  def pop
    if self.head == nil
      puts "Everybody has died"
      return nil
    elsif self.head.next_node == nil
      deleted_node = self.head
      self.head = nil
    else
      deleted_node = self.access_node(self.count-1)
      self.access_node(self.count-2).next_node = nil
    end
    puts "The #{deleted_node.surname} family has died of dysentery"
    deleted_node
  end

end
