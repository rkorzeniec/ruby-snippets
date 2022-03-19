# frozen_string_literal: true

# Given a binary tree, return the largest value in each of its levels.

# Ex: Given the following tree…
#     2
#    / \
#   10  15
#         \
#          20
# return [2, 15, 20]

# Ex: Given the following tree…

#           1
#          / \
#         5   6
#        / \   \
#       5   3   7
# return [1, 6, 7]

require_relative '../test_helper'

class Node
  attr_accessor :value, :left, :right

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinaryTree
  attr_reader :root

  def initialize(root = nil)
    @root = root
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def max_values
    return [] if root.nil?

    @max_values = []
    level_max_value(root, 0)
    @max_values
  end

  private

  def level_max_value(node, level)
    return if node.nil?

    max = @max_values[level] || -Float::INFINITY
    @max_values[level] = node.value if max < node.value

    level_max_value(node.left, level + 1)
    level_max_value(node.right, level + 1)
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    n4 = Node.new(value: 20)
    n3 = Node.new(value: 15, right: n4)
    n2 = Node.new(value: 10)
    n1 = Node.new(value: 2, left: n2, right: n3)

    bst = BinaryTree.new(n1)

    assert_equal [2, 15, 20], bst.max_values
  end

  def test_2
    n6 = Node.new(value: 7)
    n5 = Node.new(value: 6, right: n6)
    n4 = Node.new(value: 3)
    n3 = Node.new(value: 5)
    n2 = Node.new(value: 5, left: n3, right: n4)
    n1 = Node.new(value: 1, left: n2, right: n5)

    bst = BinaryTree.new(n1)

    assert_equal [1, 6, 7], bst.max_values
  end
end
