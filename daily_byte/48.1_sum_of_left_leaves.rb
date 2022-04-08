# frozen_string_literal: true

# Given a binary tree, return the sum of all left leaves of the tree.

# Ex: Given the following tree…
#     5
#    / \
#   2   12
#      /  \
#     3    8
# return 5 (i.e. 2 + 3)

# Ex: Given the following tree…
#        2
#       / \
#     4    2
#    / \
#   3   9
# return 3

require_relative '../test_helper'

class Node
  attr_accessor :val, :left, :right

  def initialize(val: 0, left: nil, right: nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def left_laves_sum(node, left_node: false)
    return 0 if node.nil?

    left = left_laves_sum(node.left, left_node: true)
    right = left_laves_sum(node.right, left_node: false)

    left_leave = left_node && node.left.nil? && node.right.nil?
    subsum = left_leave ? node.val : 0

    left + right + subsum
  end
end

class Test < Minitest::Test
  def test_1
    n5 = Node.new(val: 8)
    n4 = Node.new(val: 3)
    n3 = Node.new(val: 12, left: n4, right: n5)
    n2 = Node.new(val: 2)
    n1 = Node.new(val: 5, left: n2, right: n3)

    assert_equal 5, Solution.new.left_laves_sum(n1)
  end

  def test_2
    n5 = Node.new(val: 9)
    n4 = Node.new(val: 3)
    n3 = Node.new(val: 2)
    n2 = Node.new(val: 4, left: n4, right: n5)
    n1 = Node.new(val: 2, left: n2, right: n3)

    assert_equal 3, Solution.new.left_laves_sum(n1)
  end
end
