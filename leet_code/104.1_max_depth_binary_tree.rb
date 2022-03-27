# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/maximum-depth-of-binary-tree/

# Runtime: 102 ms, faster than 68.70% of Ruby online submissions for Maximum Depth of Binary Tree.
# Memory Usage: 211.3 MB, less than 55.65% of Ruby online submissions for Maximum Depth of Binary Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def max_depth(root)
    return 0 if root.nil?

    1 + [max_depth(root.left), max_depth(root.right)].max
  end
end

class Test < Minitest::Test
  def test_1
    i5 = TreeNode.new(7)
    i4 = TreeNode.new(15)
    i3 = TreeNode.new(20, i4, i5)
    i2 = TreeNode.new(9)
    i1 = TreeNode.new(3, i2, i3)

    assert_equal 3, Solution.new.max_depth(i1)
  end

  def test_2
    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1, nil, i2)

    assert_equal 2, Solution.new.max_depth(i1)
  end
end
