# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/validate-binary-search-tree/

# Runtime: 119 ms, faster than 68.21% of Ruby online submissions for Validate Binary Search Tree.
# Memory Usage: 211.7 MB, less than 82.08% of Ruby online submissions for Validate Binary Search Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def is_valid_bst(node, min: -Float::INFINITY, max: Float::INFINITY)
    return true if node.nil?

    if min < node.val && node.val < max
      return is_valid_bst(node.left, min:, max: node.val) &&
             is_valid_bst(node.right, min: node.val, max:)
    end

    false
  end
end

class Test < Minitest::Test
  def test_1
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(1)
    i1 = TreeNode.new(2, i2, i3)

    assert_equal true, Solution.new.is_valid_bst(i1)
  end

  def test_2
    i5 = TreeNode.new(6)
    i4 = TreeNode.new(3)
    i3 = TreeNode.new(4, i4, i5)
    i2 = TreeNode.new(1)
    i1 = TreeNode.new(5, i2, i3)

    assert_equal false, Solution.new.is_valid_bst(i1)
  end

  def test_3
    i5 = TreeNode.new(7)
    i4 = TreeNode.new(3)
    i3 = TreeNode.new(6, i4, i5)
    i2 = TreeNode.new(4)
    i1 = TreeNode.new(5, i2, i3)

    assert_equal false, Solution.new.is_valid_bst(i1)
  end
end
