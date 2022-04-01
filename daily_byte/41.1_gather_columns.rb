# frozen_string_literal: true

# Given a binary tree, return its column order traversal from top to bottom and left to right.
# NOTE: if two nodes are in the same row and column, order them from left to right.

# Ex: Given the following tree…
#     8
#    / \
#   2   29
#      /  \
#     3    9
# return [[2], [8, 3], [29], [9]]

# Ex: Given the following tree…
#      100
#     /   \
#   53     78
#  / \    /  \
# 32  3  9    20
# return [[32], [53], [100, 3, 9], [78], [20]]

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

  def gather_columns
    return [] if root.nil?

    @columns = {}
    column_order_traversal(root, column: 0)
    @columns.sort.map { |_, v| v }
  end

  private

  def column_order_traversal(node, column:)
    return if node.nil?


    list = @columns[column] || []
    list.append(node.value)
    @columns[column] = list

    column_order_traversal(node.left, column: column - 1)
    column_order_traversal(node.right, column: column + 1)
  end
end

class Test < Minitest::Test
  def test_1
    n5 = Node.new(value: 9)
    n4 = Node.new(value: 3)
    n3 = Node.new(value: 29, left: n4, right: n5)
    n2 = Node.new(value: 2)
    n1 = Node.new(value: 8, left: n2, right: n3)

    bst = BinaryTree.new(n1)

    assert_equal [[2], [8, 3], [29], [9]], bst.gather_columns
  end

  def test_2
    n7 = Node.new(value: 20)
    n6 = Node.new(value: 9)
    n5 = Node.new(value: 3)
    n4 = Node.new(value: 32)
    n3 = Node.new(value: 78, left: n6, right: n7)
    n2 = Node.new(value: 53, left: n4, right: n5)
    n1 = Node.new(value: 100, left: n2, right: n3)

    bst = BinaryTree.new(n1)

    assert_equal [[32], [53], [100, 3, 9], [78], [20]], bst.gather_columns
  end
end
