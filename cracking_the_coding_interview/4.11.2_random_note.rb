# frozen_string_literal: true

# You are implementing a binary tree class from scratch which,
# in addition to insert, find, and delete, has a method getRandomNode() which
# returns a random node from the tree.

# All nodes should be equally likely to be chosen.
# Design and implement an algorithm for getRandomNode,
# and explain how you would implement the rest of the methods.

require_relative '../test_helper'

class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def random_node
    return if root.nil?

    random_index = rand(root.size)
    root.retrieve_nth_node(random_index)
  end
end

class TreeNode
  attr_accessor :value, :left, :right, :size

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
    @size = 1
  end

  def insert(data)
    if data <= value
      if left.nil?
        @left = TreeNode.new(value: data)
      else
        left.insert(data)
      end
    elsif right.nil?
      @right = TreeNode.new(value: data)
    else
      right.insert(data)
    end

    @size += 1
  end

  def retrieve_nth_node(n)
    left_size = left&.size || 0

    return left.retrieve_nth_node(n) if n < left_size
    return right.retrieve_nth_node(n - (left_size + 1)) if n > left_size

    self
  end

  def find(data)
    return self if data == value
    return left.find(data) if left && data < value
    return right.find(data) if right && data > value

    nil
  end
end

class Test < Minitest::Test
  def test_1
    root = TreeNode.new(value: 20)
    root.insert(10)
    root.insert(30)
    root.insert(15)
    root.insert(17)
    root.insert(5)
    root.insert(7)
    root.insert(3)

    tree = Tree.new(root)

    puts "Node -> #{tree.random_node.value}"
  end
end
