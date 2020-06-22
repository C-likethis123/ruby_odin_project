require './node.rb'
# frozen_string_literal: true

# Represents a LinkedList data structure

class LinkedList
    def initialize
        @head = Node.new
    end

    def head
        @head
    end

    def append(value)
        new_node = Node.new(value)
        tail.next_node = new_node
    end
end
