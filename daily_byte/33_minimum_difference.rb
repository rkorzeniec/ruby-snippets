# frozen_string_literal: true

# Given a binary search tree, return the minimum difference between any two nodes in the tree.

# Ex: Given the following tree...
#         2
#        / \
#       3   1
# return 1.

# Ex: Given the following tree...
#         29
#        /  \
#      17   50
#     /     / \
#    1    42  59
# return 8.

# Ex: Given the following tree...
#         2
#          \
#          100
# return 98.

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

  def minimum_difference(node: root)
    return if node.nil?

    current_diffs = []

    current_diffs.append(node.value - node.left.value) if node.left
    current_diffs.append(node.right.value - node.value) if node.right

    left_diff = minimum_difference(node: node.left)
    right_diff = minimum_difference(node: node.right)

    [current_diffs.min, left_diff, right_diff].compact.min
  end

  private

  def initialize_root(value)
    @root = Node.new(value:)
  end

  def insert_node(value:, node:)
    return Node.new(value:) if node.nil?
    return node if node.value == value

    if node.value < value
      node.right = insert_node(node: node.right, value:)
    else
      node.left = insert_node(node: node.left, value:)
    end

    node
  end
end

class Test < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(value: 2)
    bst.insert(value: 3)
    bst.insert(value: 1)

    assert_equal 1, bst.minimum_difference
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(value: 29)
    bst.insert(value: 17)
    bst.insert(value: 1)
    bst.insert(value: 50)
    bst.insert(value: 42)
    bst.insert(value: 59)

    assert_equal 8, bst.minimum_difference
  end

  def test_3
    bst = BinarySearchTree.new
    bst.insert(value: 2)
    bst.insert(value: 100)

    assert_equal 98, bst.minimum_difference
  end
end
