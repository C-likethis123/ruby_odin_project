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

    # Inserts a value in the tree
    # Ignores duplicates
    def insert(value, tree=@root)
        if @root.value.nil?
            @root.value == value
        elsif value > tree.value
            node.right.nil? 
                ? node.right = Node.new(value)
                : insert(value, tree.right)
        elsif value < tree.value
            node.left.nil? 
                ? node.left = Node.new(value)
                : insert(value, tree.left)
        end 
    end

    private def no_children?(node)
        node.left.nil? && node.right.nil?
    end

    def delete(value, tree=@root)
    end

end
