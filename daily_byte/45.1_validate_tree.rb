# frozen_string_literal: true

# Given a binary tree, containing unique values, determine if it is a valid binary search tree.
# Note: the invariants of a binary search tree (in our case)
# are all values to the left of a given node are less than the current node’s value,
# all values to the right of a given node are greater than the current node’s value,
# and both the left and right subtrees of a given node must also be binary search trees.

# Ex: Given the following binary tree…
#    1
#  /   \
# 2     3
# return false

# Ex: Given the following tree…
#    2
#  /   \
# 1     3
# return true

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
  def valid_bst?(root)
    return true if root.nil?
    return false unless valid_bst?(root.left)
    return false if @last_value && root.val <= @last_value

    @last_value = root.val

    return false unless valid_bst?(root.right)

    true
  end
end

class Test < Minitest::Test
  def test_1
    n3 = Node.new(val: 3)
    n2 = Node.new(val: 2)
    n1 = Node.new(val: 1, left: n2, right: n3)

    assert_equal false, Solution.new.valid_bst?(n1)
  end

  def test_2
    n3 = Node.new(val: 3)
    n2 = Node.new(val: 1)
    n1 = Node.new(val: 2, left: n2, right: n3)

    assert_equal true, Solution.new.valid_bst?(n1)
  end
end
