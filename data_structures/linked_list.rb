# frozen_string_literal: true

require './node.rb'
# Represents a LinkedList data structure
class LinkedList
  def initialize
    @head = Node.new
    @tail = @head
  end

  def append(value)
    new_node = Node.new(value)
    @tail.next_node = new_node
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head.next_node)
    @head.next_node = new_node
  end

  def size
    size_of_node = 0
    node = @head.next_node
    while node
      node = node.next_node
      size_of_node += 1
    end
    size_of_node
  end

  attr_reader :head

  attr_reader :tail

  def at(index)
    n = 0
    node = @head.next_node
    while index != n
      node = node.next_node
      n += 1
    end
    node
  end

  def pop
    if size == 1
      @head.next_node = nil
      @tail = @head
    else
      node = @head.next_node
      node = node.next_node while node.next_node.next_node
      node.next_node = nil
      @tail = node
    end
  end

  def contains?(value)
    node = @head.next_node
    while node
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head.next_node
    index = 0
    while node
      return index if node.value == value

      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    res = ''
    node = @head.next_node
    while node
      res += "( #{node.value} ) -> "
      node = node.next_node
    end
    res + 'nil'
  end
end

# # test cases

# size
linked_list = LinkedList.new
puts linked_list.empty?

# append
linked_list = LinkedList.new
linked_list.append(5)
puts linked_list.size == 1
linked_list.append(9)
puts linked_list.size == 2

# prepend
linked_list.prepend(2)
puts linked_list.to_s == '( 2 ) -> ( 5 ) -> ( 9 ) -> nil'

# to_s
puts linked_list.to_s

# at

puts linked_list.at(0).value == 2
puts linked_list.at(1).value == 5

# finds
puts linked_list.find(2).zero?
puts linked_list.find(5) == 1
puts linked_list.find(9) == 2
puts linked_list.find(1).nil?

# contains
puts linked_list.contains?(2) == true
puts linked_list.contains?(5) == true
puts linked_list.contains?(1) == true

# pop
linked_list.pop
puts linked_list.to_s == '( 2 ) -> ( 5 ) -> nil'
linked_list.pop
puts linked_list.to_s == '( 2 ) -> nil'
puts linked_list.contains?(9) == false
linked_list.pop
puts linked_list.to_s == 'nil'
puts linked_list.contains?(1) == false
puts linked_list.find(1).nil?
