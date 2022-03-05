# frozen_string_literal: true

# Given a binary search tree that contains unique values and two nodes within the tree,
# a, and b, return their lowest common ancestor.

# NOTE: the lowest common ancestor of two nodes is the deepest node within the tree
# such that both nodes are descendants of it.

# Ex: Given the following tree...
#        7
#       / \
#     2    9
#    / \
#   1   5
# and a = 1, b = 9, return a reference to the node containing 7.

# Ex: Given the following tree...
#         8
#        / \
#       3   9
#      / \
#     2   6
# and a = 2, b = 6, return a reference to the node containing 3.

# Ex: Given the following tree...
#         8
#        / \
#       6   9
# and a = 6, b = 8, return a reference to the node containing 8.

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

  def ancestor(value1, value2, node: root)
    return node if value1 == node.value || value2 == node.value
    return node if value1 < node.value && value2 > node.value

    if value1 < node.value && value2 < node.value
      ancestor(value1, value2, node: node.left)
    else
      ancestor(value1, value2, node: node.right)
    end
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

class TestBinarySearchTree < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(value: 7)
    bst.insert(value: 2)
    bst.insert(value: 9)
    bst.insert(value: 1)
    bst.insert(value: 5)

    assert_equal 7, bst.ancestor(1, 9).value
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(value: 8)
    bst.insert(value: 3)
    bst.insert(value: 9)
    bst.insert(value: 2)
    bst.insert(value: 6)

    assert_equal 3, bst.ancestor(2, 6).value
  end

  def test_3
    bst = BinarySearchTree.new
    bst.insert(value: 8)
    bst.insert(value: 6)
    bst.insert(value: 9)

    assert_equal 8, bst.ancestor(6, 8).value
  end
end
