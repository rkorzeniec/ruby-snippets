# frozen_string_literal: true

# Given two binary trees, return whether or not both trees have the same leaf sequence.
# Two trees have the same leaf sequence if both trees’ leaves read the same from left to right.

# Ex: Given the following trees…
#    1
#  /   \
# 1     3

# and

#    7
#  /   \
# 1     2
# return false as both the trees' leaves don't read the same from left to right
# (i.e. [1, 3] and [1, 2]).

# Ex: Given the following trees…
#     8
#    / \
#   2   29
#     /  \
#    3    9

# and

#     8
#    / \
#   2  29
#  /   /  \
# 2   3    9
#      \
#       3
# return true as both the trees' leaves read the same from left to right
# (i.e. [2, 3, 9] and [2, 3, 9]).

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
  def identical_leaves?(node1, node2)
    node1_leaf_values = leaf_values(node1)
    node2_leaf_values = leaf_values(node2)

    node1_leaf_values == node2_leaf_values
  end

  private

  def leaf_values(node, result: [])
    leaf_values(node.left, result:) if node.left
    leaf_values(node.right, result:) if node.right

    node.left.nil? && node.right.nil? ? result.append(node.val) : result
  end
end

class Test < Minitest::Test
  def test_1
    n3 = Node.new(val: 3)
    n2 = Node.new(val: 1)
    n1 = Node.new(val: 1, left: n2, right: n3)

    i3 = Node.new(val: 2)
    i2 = Node.new(val: 1)
    i1 = Node.new(val: 7, left: i2, right: i3)

    assert_equal false, Solution.new.identical_leaves?(n1, i1)
  end

  def test_2
    n5 = Node.new(val: 9)
    n4 = Node.new(val: 3)
    n3 = Node.new(val: 29, left: n4, right: n5)
    n2 = Node.new(val: 2)
    n1 = Node.new(val: 8, left: n2, right: n3)

    i6 = Node.new(val: 3)
    i5 = Node.new(val: 9)
    i4 = Node.new(val: 3, right: i6)
    i3 = Node.new(val: 29, left: i4, right: i5)
    i2 = Node.new(val: 2)
    i1 = Node.new(val: 8, left: i2, right: i3)

    assert_equal true, Solution.new.identical_leaves?(n1, i1)
  end
end
