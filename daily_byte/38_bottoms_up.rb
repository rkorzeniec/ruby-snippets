# frozen_string_literal: true

# Given a binary tree, returns of all its levels in a bottom-up fashion
# (i.e. last level towards the root).

# Ex: Given the following tree…
#         2
#        / \
#       1   2
# return [[1, 2], [2]]

# Ex: Given the following tree…
#        7
#       / \
#     6    2
#    / \
#   3   3
# return [[3, 3], [6, 2], [7]]

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

  def values
    return [] if root.nil?

    @levels = []
    level_values(root, 0)
    @levels.reverse
  end

  private

  def level_values(node, level)
    return if node.nil?

    level_values(node.left, level + 1)
    level_values(node.right, level + 1)
    @levels[level] = @levels[level] ? @levels[level] + [node.value] : [node.value]
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    n3 = Node.new(value: 2)
    n2 = Node.new(value: 1)
    n1 = Node.new(value: 2, left: n2, right: n3)

    bt = BinaryTree.new(n1)

    assert_equal [[1, 2], [2]], bt.values
  end

  def test_2
    n5 = Node.new(value: 3)
    n4 = Node.new(value: 3)
    n3 = Node.new(value: 2)
    n2 = Node.new(value: 6, left: n4, right: n5)
    n1 = Node.new(value: 7, left: n2, right: n3)

    bt = BinaryTree.new(n1)

    assert_equal [[3, 3], [6, 2], [7]], bt.values
  end
end
