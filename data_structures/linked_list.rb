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
        node = @head
        unless node.nil?
            node = node.next_node
            size_of_node += 1
        end
    end
