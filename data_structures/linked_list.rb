require './node.rb'
# frozen_string_literal: true

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

    def head
        @head
    end

    def tail
        @tail
    end

    def to_s
        res = ""
        node = @head.next_node
        while node
            res += "( #{node.value} ) -> "
            node = node.next_node
        end
        res += "nil"
    end
end

# # test cases

# size
linked_list = LinkedList.new
puts linked_list.size == 0

# append
linked_list = LinkedList.new
linked_list.append(5)
puts linked_list.size == 1
linked_list.append(9)
puts linked_list.size == 2

# prepend
linked_list.prepend(2)
puts linked_list.to_s == "( 2 ) -> ( 5 ) -> ( 9 ) -> nil"

# to_s
puts linked_list.to_s
