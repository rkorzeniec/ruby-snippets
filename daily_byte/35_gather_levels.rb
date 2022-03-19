# frozen_string_literal: true

# Given a binary tree, return its level order traversal
# where the nodes in each level are ordered from left to right.

# Ex: Given the following tree...
#     4
#    / \
#   2   7
# return [[4], [2, 7]]

# Ex: Given the following tree...
#     2
#    / \
#   10  15
#         \
#          20
# return [[2], [10, 15], [20]]

# Ex: Given the following tree...
#     1
#    / \
#   9   32
#  /      \
# 3        78
# return [[1], [9, 32], [3, 78]]

require_relative '../test_helper'

class Node
  attr_accessor :value, :left, :right

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value:)
    return initialize_root(value) if root.nil?

    insert_node(value:, node: root)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def levels
    @lists = []
    inorder_levels(node: root, depth: 0)
    @lists
  end

  private

  def initialize_root(value)
    @root = Node.new(value:)
  end

  def insert_node(value:, node:)
    return Node.new(value:) if node.nil?

    if node.value <= value
      node.right = insert_node(node: node.right, value:)
    else
      node.left = insert_node(node: node.left, value:)
    end

    node
  end

  def inorder_levels(node:, depth:)
    return if node.nil?

    list = @lists[depth] || []
    @lists[depth] = list.append(node.value)

    inorder_levels(node: node.left, depth: depth + 1)
    inorder_levels(node: node.right, depth: depth + 1)
  end
end

class Test < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(value: 4)
    bst.insert(value: 2)
    bst.insert(value: 7)

    bst.pretty_print

    assert_equal [[4], [2, 7]], bst.levels
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(value: 2)
    bst.insert(value: 1)
    bst.insert(value: 15)
    bst.insert(value: 20)

    bst.pretty_print

    assert_equal [[2], [1, 15], [20]], bst.levels
  end

  def test_3
    bst = BinarySearchTree.new
    bst.insert(value: 10)
    bst.insert(value: 9)
    bst.insert(value: 3)
    bst.insert(value: 32)
    bst.insert(value: 78)

    bst.pretty_print

    assert_equal [[10], [9, 32], [3, 78]], bst.levels
  end
end
