# frozen_string_literal: true

# Given two binary trees, return whether or not the two trees are identical.
# Note: identical meaning they exhibit the same structure and the same values at each node.

# Ex: Given the following trees...
#         2
#        / \
#       1   3
#     2
#    / \
#   1   3

# return true.

# Ex: Given the following trees...

#         1
#          \
#           9
#            \
#            18
#     1
#    /
#   9
#    \
#     18

# return false.

# Ex: Given the following trees...

#         2
#        / \
#       3   1
#     2
#    / \
#   1   3
# return false.

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

  def initialize
    @root = nil
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def equal?(node1, node2)
    return false if node1.nil? && !node2.nil?
    return false if !node1.nil? && node2.nil?
    return true if node1.nil? && node2.nil?
    return false if node1.value != node2.value

    equal?(node1&.left, node2&.left) && equal?(node1&.right, node2&.right)
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    bst = BinaryTree.new
    n3 = Node.new(value: 3)
    n1 = Node.new(value: 1)
    n2 = Node.new(value: 2, left: n1, right: n3)

    k3 = Node.new(value: 3)
    k1 = Node.new(value: 1)
    k2 = Node.new(value: 2, left: k1, right: k3)

    assert_equal true, bst.equal?(n2, k2)
  end

  def test_2
    bst = BinaryTree.new
    n10 = Node.new(value: 10)
    n9 = Node.new(value: 9, right: n10)
    n1 = Node.new(value: 1, right: n9)

    k10 = Node.new(value: 10)
    k9 = Node.new(value: 9, right: k10)
    k1 = Node.new(value: 1, left: k9)

    assert_equal false, bst.equal?(n1, k1)
  end

  def test_3
    bst = BinaryTree.new
    n3 = Node.new(value: 3)
    n1 = Node.new(value: 1)
    n2 = Node.new(value: 2, left: n3, right: n1)

    k3 = Node.new(value: 3)
    k1 = Node.new(value: 1)
    k2 = Node.new(value: 2, left: k1, right: k3)

    assert_equal false, bst.equal?(n2, k2)
  end
end
