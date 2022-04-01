# frozen_string_literal: true

# Given a binary tree, return its maximum depth.
# Note: the maximum depth is defined as the number of nodes along the longest path
# from root node to leaf node.

# Ex: Given the following tree…
#     9
#    / \
#   1   2
# return 2

# Ex: Given the following tree…
#     5
#    / \
#   1  29
#     /  \
#    4   13
# return 3

require_relative '../test_helper'

class Node
  attr_accessor :value, :left, :right

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end

class Solution
  def depth(root, depth: 0)
    return depth if root.nil?

    [depth(root.left, depth: depth + 1), depth(root.right, depth: depth + 1)].max
  end
end

class Test < Minitest::Test
  def test_1
    n3 = Node.new(value: 2)
    n2 = Node.new(value: 1)
    n1 = Node.new(value: 9, left: n2, right: n3)

    assert_equal 2, Solution.new.depth(n1)
  end

  def test_2
    n5 = Node.new(value: 13)
    n4 = Node.new(value: 4)
    n3 = Node.new(value: 29, left: n4, right: n5)
    n2 = Node.new(value: 1)
    n1 = Node.new(value: 5, left: n2, right: n3)

    assert_equal 3, Solution.new.depth(n1)
  end
end
