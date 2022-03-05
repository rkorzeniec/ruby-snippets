# frozen_string_literal: true

# Given a binary search tree, rearrange the tree such that it forms a linked list
# where all its values are in ascending order.

# Ex: Given the following tree...
#         5
#        / \
#       1   6

# return...
# 1
#  \
#   5
#    \
#     6

# Ex: Given the following tree...
#        5
#       / \
#     2    9
#    / \
#   1   3

# return...
# 1
#  \
#   2
#    \
#     3
#      \
#       5
#        \
#         9

# Ex: Given the following tree...
# 5
#  \
#   6

# return...
# 5
#  \
#   6

require 'minitest/autorun'

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

  def rearrange
    dummy_node = Node.new
    @previous_node = dummy_node

    inorder_traversal(root)

    @previous_node.right = nil
    @previous_node.left = nil

    dummy_node.right
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

  def inorder_traversal(node)
    return if node.nil?

    inorder_traversal(node.left)

    @previous_node.left = nil
    @previous_node.right = node
    @previous_node = node

    inorder_traversal(node.right)
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(value: 5)
    bst.insert(value: 1)
    bst.insert(value: 6)

    node = bst.rearrange
    assert_equal 1, node.value
    assert_nil node.left

    node = node.right
    assert_equal 5, node.value
    assert_nil node.left

    node = node.right
    assert_equal 6, node.value
    assert_nil node.left
    assert_nil node.right
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(value: 5)
    bst.insert(value: 2)
    bst.insert(value: 9)
    bst.insert(value: 1)
    bst.insert(value: 3)

    node = bst.rearrange
    assert_equal 1, node.value
    assert_nil node.left

    node = node.right
    assert_equal 2, node.value
    assert_nil node.left

    node = node.right
    assert_equal 3, node.value
    assert_nil node.left

    node = node.right
    assert_equal 5, node.value
    assert_nil node.left

    node = node.right
    assert_equal 9, node.value
    assert_nil node.left
    assert_nil node.right
  end

  def test_3
    bst = BinarySearchTree.new
    bst.insert(value: 5)
    bst.insert(value: 6)

    node = bst.rearrange
    assert_equal 5, node.value
    assert_nil node.left

    node = node.right
    assert_equal 6, node.value
    assert_nil node.left
    assert_nil node.right
  end
end
