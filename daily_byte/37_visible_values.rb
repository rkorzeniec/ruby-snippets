# frozen_string_literal: true

# Given a binary tree return all the values you’d be able to see
# if you were standing on the left side of it with values ordered from top to bottom.

# Ex: Given the following tree…
# -->    4
#       / \
# -->  2   7
# return [4, 2]

# Ex: Given the following tree…
# -->        7
#          /  \
# -->     4     9
#        / \   / \
# -->   1   4 8   9
#                  \
# -->               9
# return [7, 4, 1, 9]

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

  def visible_values
    return [] if root.nil?

    @visible_values = []
    lefmost_value(root, 0)
    @visible_values
  end

  private

  def lefmost_value(node, level)
    return if node.nil?

    @visible_values.append(node.value) if @visible_values[level].nil?
    lefmost_value(node.left, level + 1)
    lefmost_value(node.right, level + 1)
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    n3 = Node.new(value: 7)
    n2 = Node.new(value: 2)
    n1 = Node.new(value: 4, left: n2, right: n3)

    bt = BinaryTree.new(n1)

    assert_equal [4, 2], bt.visible_values
  end

  def test_2
    n8 = Node.new(value: 9)
    n7 = Node.new(value: 9, right: n8)
    n6 = Node.new(value: 8)
    n5 = Node.new(value: 4)
    n4 = Node.new(value: 1)
    n3 = Node.new(value: 9, left: n6, right: n7)
    n2 = Node.new(value: 4, left: n4, right: n5)
    n1 = Node.new(value: 7, left: n2, right: n3)

    bt = BinaryTree.new(n1)

    assert_equal [7, 4, 1, 9], bt.visible_values
  end
end
