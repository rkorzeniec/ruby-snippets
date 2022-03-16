# frozen_string_literal: true

# You are implementing a binary tree class from scratch which,
# in addition to insert, find, and delete, has a method getRandomNode() which
# returns a random node from the tree.

# All nodes should be equally likely to be chosen.
# Design and implement an algorithm for getRandomNode,
# and explain how you would implement the rest of the methods.

require_relative '../test_helper'

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

  def random_node
    left_size = left&.size || 0
    random_index = rand(size)

    return left.random_node if random_index < left_size
    return right.random_node if random_index > left_size

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

    puts "Node -> #{root.random_node.value}"
  end

  def test_2
    root = TreeNode.new(value: 20)
    root.insert(10)
    root.insert(30)
    root.insert(15)
    root.insert(17)
    root.insert(5)
    root.insert(7)
    root.insert(3)

    puts "Node -> #{root.find(10).inspect}"
    puts
    puts "Node -> #{root.find(3).inspect}"
    puts
    puts "Node -> #{root.find(1).inspect}"
    puts
    puts "Node -> #{root.find(109).inspect}"
    puts
    puts "Node -> #{root.find(17).inspect}"
    puts
    puts "Node -> #{root.find(7).inspect}"
  end
end
