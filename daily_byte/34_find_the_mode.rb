# frozen_string_literal: true

# Given a binary search tree,
# return its mode (you may assume the answer is unique).
# If the tree is empty, return -1.

# NOTE: the mode is the most frequently occurring value in the tree.

# Ex: Given the following tree...
#         2
#        / \
#       1   2
# return 2.

# Ex: Given the following tree...
#          7
#         / \
#       4     9
#      / \   / \
#     1   4 8   9
#                \
#                 9
# return 9.

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

  def mode
    cache = Hash.new(0)

    inorder(root, cache)

    cache.max_by { |_, value| value }.first
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

  def inorder(node, cache)
    return if node.nil?

    inorder(node.left, cache)
    cache[node.value] += 1
    inorder(node.right, cache)
  end
end

class Test < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(value: 2)
    bst.insert(value: 1)
    bst.insert(value: 2)

    bst.pretty_print

    assert_equal 2, bst.mode
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(value: 7)
    bst.insert(value: 4)
    bst.insert(value: 1)
    bst.insert(value: 4)
    bst.insert(value: 9)
    bst.insert(value: 8)
    bst.insert(value: 9)
    bst.insert(value: 9)

    bst.pretty_print

    assert_equal 9, bst.mode
  end
end
