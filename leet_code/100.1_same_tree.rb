# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/same-tree/

# Runtime: 105 ms, faster than 57.53% of Ruby online submissions for Same Tree.
# Memory Usage: 210.8 MB, less than 100.00% of Ruby online submissions for Same Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def is_same_tree(node1, node2)
    return true if node1.nil? && node2.nil?
    return false if node1.nil?
    return false if node2.nil?

    node1.val == node2.val &&
      is_same_tree(node1.left, node2.left) &&
      is_same_tree(node1.right, node2.right)
  end
end

class Test < Minitest::Test
  def test_1
    j3 = TreeNode.new(3)
    j2 = TreeNode.new(2)
    j1 = TreeNode.new(1, j2, j3)

    i3 = TreeNode.new(3)
    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1, i2, i3)

    assert_equal true, Solution.new.is_same_tree(i1, j1)
  end

  def test_2
    j2 = TreeNode.new(2)
    j1 = TreeNode.new(1, nil, j2)

    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1, i2)

    assert_equal false, Solution.new.is_same_tree(i1, j1)
  end

  def test_3
    j3 = TreeNode.new(2)
    j2 = TreeNode.new(1)
    j1 = TreeNode.new(1, j2, j3)

    i3 = TreeNode.new(1)
    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1, i2, i3)

    assert_equal false, Solution.new.is_same_tree(i1, j1)
  end
end
