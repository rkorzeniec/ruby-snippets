# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/search-in-a-binary-search-tree/

# Runtime: 88 ms, faster than 95.74% of Ruby online submissions for Search in a Binary Search Tree.
# Memory Usage: 212.4 MB, less than 36.17% of Ruby online submissions for Search in a Binary Search Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def search_bst(root, val)
    return root if val == root.val
    return search_bst(root.left, val) if root.left && val < root.val
    return search_bst(root.right, val) if root.right && val > root.val

    nil
  end
end

class Test < Minitest::Test
  def test_1
    i5 = TreeNode.new(3)
    i4 = TreeNode.new(1)
    i3 = TreeNode.new(7)
    i2 = TreeNode.new(2, i4, i5)
    i1 = TreeNode.new(4, i2, i3)

    assert_equal i2, Solution.new.search_bst(i1, 2)
  end

  def test_2
    i5 = TreeNode.new(3)
    i4 = TreeNode.new(1)
    i3 = TreeNode.new(7)
    i2 = TreeNode.new(2, i4, i5)
    i1 = TreeNode.new(4, i2, i3)

    assert_nil Solution.new.search_bst(i1, 5)
  end
end
