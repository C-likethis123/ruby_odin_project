# Represents a Binary Search Tree
require './node.rb'
class Tree
    attr_reader :root
    def initialize(arr)
        @root = build_tree(arr)
    end

    # builds a balanced BST with an array
    def build_tree(arr)
        arr.sort!.uniq!
        
        return Node.new(nil) if arr.empty?
        return Node.new(arr[0]) if arr.length == 1
        med = arr.length / 2
        return Node.new(arr[med], build_tree(arr[0...med]), build_tree(arr[(med+1)..]))
    end
end
