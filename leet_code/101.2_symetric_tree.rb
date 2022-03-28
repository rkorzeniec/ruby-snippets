# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/symmetric-tree/

# Runtime: 56 ms, faster than 99.20% of Ruby online submissions for Symmetric Tree.
# Memory Usage: 210.9 MB, less than 88.80% of Ruby online submissions for Symmetric Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def is_symmetric(root)
    return if root.nil?

    stack = [[root.left, root.right]]

    until stack.empty?
      left, right = stack.pop

      next if left.nil? && right.nil?

      return false if left.nil? || right.nil? || left.val != right.val

      stack.append([left.left, right.right])
      stack.append([left.right, right.left])
    end

    true
  end
end

class Test < Minitest::Test
  def test_1
    i7 = TreeNode.new(4)
    i6 = TreeNode.new(3)
    i5 = TreeNode.new(2, i7, i6)
    i4 = TreeNode.new(4)
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(2, i3, i4)
    i1 = TreeNode.new(1, i2, i5)

    assert_equal true, Solution.new.is_symmetric(i1)
  end

  def test_2
    i6 = TreeNode.new(3)
    i5 = TreeNode.new(2, nil, i6)
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(2, nil, i3)
    i1 = TreeNode.new(1, i2, i5)

    assert_equal false, Solution.new.is_symmetric(i1)
  end
end
