require './node.rb'
# frozen_string_literal: true

# Represents a LinkedList data structure

class LinkedList
    def initialize
        @head = Node.new
        @tail = @head
    end

    def head
        @head
    end

    def tail
        @tail
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

    def append(value)
        new_node = Node.new(value)
        @tail.next_node = new_node
        @tail = new_node
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
