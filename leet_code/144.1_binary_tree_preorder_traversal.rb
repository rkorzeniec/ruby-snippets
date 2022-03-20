# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/binary-tree-preorder-traversal/

# Runtime: 60 ms, faster than 98.53% of Ruby online submissions for Binary Tree Preorder Traversal.
# Memory Usage: 211 MB, less than 77.21% of Ruby online submissions for Binary Tree Preorder Traversal.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def preorder_traversal(root)
    return [] if root.nil?

    list = [root.val]
    list += preorder_traversal(root.left) if root.left
    list += preorder_traversal(root.right) if root.right

    list
  end
end

class Test < Minitest::Test
  def test_1
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1)

    i1.right = i2
    i2.left = i3

    assert_equal [1, 2, 3], Solution.new.preorder_traversal(i1)
  end

  def test_2
    assert_equal [], Solution.new.preorder_traversal(nil)
  end

  def test_3
    i1 = TreeNode.new(1)

    assert_equal [1], Solution.new.preorder_traversal(i1)
  end
end
