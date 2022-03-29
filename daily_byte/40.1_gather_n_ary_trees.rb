# frozen_string_literal: true

# Given an n-ary tree, return its level order traversal.
# Note: an n-ary tree is a tree in which each node has no more than N children.

# Ex: Give the following n-ary tree…
#     8
#   / | \
#  2  3  29
# return [[8], [2, 3, 29]]

# Ex: Given the following n-ary tree…
#      2
#    / | \
#   1  6  9
#  /   |   \
# 8    2    2
#    / | \
#  19 12 90
# return [[2], [1, 6, 9], [8, 2, 2], [19, 12, 90]]

require_relative '../test_helper'

class Node
  attr_accessor :value, :children

  def initialize(value: 0, children: [])
    @value = value
    @children = children
  end
end

class Solution
  def level_order_traversal(node)
    return [] if node.nil?

    lists = []
    queue = [node]

    level = 0
    nodes_in_level = 1

    until queue.empty?
      node = queue.shift
      lists[level] = lists[level] ? lists[level] + [node.value] : [node.value]

      queue += node.children unless node.children.empty?

      nodes_in_level -= 1

      if nodes_in_level.zero?
        nodes_in_level = queue.size
        level += 1
      end
    end

    lists
  end

  private

  def level_max_value(node, level)
    return if node.nil?

    max = @max_values[level] || -Float::INFINITY
    @max_values[level] = node.value if max < node.value

    level_max_value(node.left, level + 1)
    level_max_value(node.right, level + 1)
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    n4 = Node.new(value: 29)
    n3 = Node.new(value: 3)
    n2 = Node.new(value: 2)
    n1 = Node.new(value: 8, children: [n2, n3, n4])

    assert_equal [[8], [2, 3, 29]], Solution.new.level_order_traversal(n1)
  end

  def test_2
    n10 = Node.new(value: 90)
    n9 = Node.new(value: 12)
    n8 = Node.new(value: 19)
    n7 = Node.new(value: 2)
    n6 = Node.new(value: 2, children: [n8, n9, n10])
    n5 = Node.new(value: 8)
    n4 = Node.new(value: 9, children: [n7])
    n3 = Node.new(value: 6, children: [n6])
    n2 = Node.new(value: 1, children: [n5])
    n1 = Node.new(value: 2, children: [n2, n3, n4])

    assert_equal [[2], [1, 6, 9], [8, 2, 2], [19, 12, 90]], Solution.new.level_order_traversal(n1)
  end
end
