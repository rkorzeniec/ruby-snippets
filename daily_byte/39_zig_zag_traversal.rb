# frozen_string_literal: true

# Given a binary tree, return its zig-zag level order traversal
# (i.e. its level order traversal from left to right the first level,
# right to left the level the second, etc.).

# Ex: Given the following tree…
#     1
#    / \
#   2   3
# return [[1], [3, 2]]

# Ex: Given the following tree…
#     8
#    / \
#   2  29
#     /  \
#    3    9
# return [[8], [29, 2], [3, 9]]

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

  def zig_zag
    return [] if root.nil?

    @lists = []
    zig_zag_traversal(root, level: 0, ltr: true)
    @lists
  end

  private

  def zig_zag_traversal(node, level:, ltr:)
    return if node.nil?

    list = @lists[level] ? @lists[level] : []
    list = ltr ? list + [node.value] : [node.value] + list
    @lists[level] = list

    zig_zag_traversal(node.left, level: level + 1, ltr: !ltr)
    zig_zag_traversal(node.right, level: level + 1, ltr: !ltr)
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    n3 = Node.new(value: 3)
    n2 = Node.new(value: 2)
    n1 = Node.new(value: 1, left: n2, right: n3)

    bst = BinaryTree.new(n1)

    assert_equal [[1], [3, 2]], bst.zig_zag
  end

  def test_2
    n5 = Node.new(value: 9)
    n4 = Node.new(value: 3)
    n3 = Node.new(value: 29, left: n4, right: n5)
    n2 = Node.new(value: 2)
    n1 = Node.new(value: 8, left: n2, right: n3)

    bst = BinaryTree.new(n1)

    assert_equal [[8], [29, 2], [3, 9]], bst.zig_zag
  end
end
