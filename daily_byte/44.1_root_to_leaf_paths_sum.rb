# frozen_string_literal: true

# Given a binary tree and a target, return whether or not there exists a root to leaf path
# such that all values along the path sum to the target.

# Ex: Given the following tree…
#       1
#      / \
#     5   2
#    /   / \
#   1  12   29
# and a target of 15, return true as the path 1->2->12 sums to 15.

# Ex: Given the following tree…
#      104
#     /   \
#   39     31
#  / \    /  \
# 32  1  9    10
# and a target of 175, return true as the path 104->39->32 sums to 175.

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
  def path_to_leaf(root, target)
    return target.zero? if root.nil?

    remaining = target - root.val

    path_to_leaf(root.left, remaining) || path_to_leaf(root.right, remaining)
  end
end

class Test < Minitest::Test
  def test_1
    n6 = Node.new(val: 29)
    n5 = Node.new(val: 12)
    n4 = Node.new(val: 1)
    n3 = Node.new(val: 2, left: n5, right: n6)
    n2 = Node.new(val: 5, left: n4)
    n1 = Node.new(val: 1, left: n2, right: n3)

    assert_equal true, Solution.new.path_to_leaf(n1, 15)
  end

  def test_2
    n7 = Node.new(val: 10)
    n6 = Node.new(val: 9)
    n5 = Node.new(val: 1)
    n4 = Node.new(val: 32)
    n3 = Node.new(val: 31, left: n6, right: n7)
    n2 = Node.new(val: 39, left: n4, right: n5)
    n1 = Node.new(val: 104, left: n2, right: n3)

    assert_equal true, Solution.new.path_to_leaf(n1, 175)
  end
end
