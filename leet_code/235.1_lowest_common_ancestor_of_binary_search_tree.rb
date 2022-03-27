# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

# Runtime: 84 ms, faster than 98.73% of Ruby online submissions for Lowest Common Ancestor of a Binary Search Tree.
# Memory Usage: 212.5 MB, less than 27.85% of Ruby online submissions for Lowest Common Ancestor of a Binary Search Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def lowest_common_ancestor(root, p, q)
    p, q = q, p if p.val > q.val

    return root if p.val <= root.val && q.val >= root.val
    return lowest_common_ancestor(root.left, p, q) if q.val <= root.val

    lowest_common_ancestor(root.right, p, q)
  end
end

class Test < Minitest::Test
  def test_1
    i9 = TreeNode.new(5)
    i8 = TreeNode.new(3)
    i7 = TreeNode.new(9)
    i6 = TreeNode.new(7)
    i5 = TreeNode.new(4, i8, i9)
    i4 = TreeNode.new(0)
    i3 = TreeNode.new(8, i6, i7)
    i2 = TreeNode.new(2, i4, i5)
    i1 = TreeNode.new(6, i2, i3)

    assert_equal i1, Solution.new.lowest_common_ancestor(i1, i2, i3)
  end

  def test_2
    i9 = TreeNode.new(5)
    i8 = TreeNode.new(3)
    i7 = TreeNode.new(9)
    i6 = TreeNode.new(7)
    i5 = TreeNode.new(4, i8, i9)
    i4 = TreeNode.new(0)
    i3 = TreeNode.new(8, i6, i7)
    i2 = TreeNode.new(2, i4, i5)
    i1 = TreeNode.new(6, i2, i3)

    assert_equal i2, Solution.new.lowest_common_ancestor(i1, i2, i5)
  end

  def test_3
    i2 = TreeNode.new(1)
    i1 = TreeNode.new(2, i2)

    assert_equal i1, Solution.new.lowest_common_ancestor(i1, i1, i2)
  end
end
