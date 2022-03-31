# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/path-sum/

# Runtime: 91 ms, faster than 75.86% of Ruby online submissions for Path Sum.
# Memory Usage: 211.3 MB, less than 46.21% of Ruby online submissions for Path Sum.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def has_path_sum(root, target_sum)
    return false if root.nil?

    remaining = target_sum - root.val
    return true if remaining.zero? && root.left.nil? && root.right.nil?

    has_path_sum(root.left, remaining) || has_path_sum(root.right, remaining)
  end
end

class Test < Minitest::Test
  def test_1
    i9 = TreeNode.new(1)
    i8 = TreeNode.new(2)
    i7 = TreeNode.new(7)
    i6 = TreeNode.new(4, nil, i9)
    i5 = TreeNode.new(13)
    i4 = TreeNode.new(11, i7, i8)
    i3 = TreeNode.new(8, i5, i6)
    i2 = TreeNode.new(4, i4)
    i1 = TreeNode.new(5, i2, i3)

    assert_equal true, Solution.new.has_path_sum(i1, 22)
  end

  def test_2
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1, i2, i3)

    assert_equal false, Solution.new.has_path_sum(i1, 5)
  end

  def test_3
    assert_equal false, Solution.new.has_path_sum(nil, 5)
  end
end
