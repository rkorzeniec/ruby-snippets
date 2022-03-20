# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/binary-tree-inorder-traversal/

# Runtime: 68 ms, faster than 88.84% of Ruby online submissions for Binary Tree Inorder Traversal.
# Memory Usage: 211.2 MB, less than 10.76% of Ruby online submissions for Binary Tree Inorder Traversal.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def inorder_traversal(root)
    return [] if root.nil?

    list = []

    list += inorder_traversal(root.left) if root.left
    list.append(root.val)
    list += inorder_traversal(root.right) if root.right

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

    assert_equal [1, 3, 2], Solution.new.inorder_traversal(i1)
  end

  def test_2
    assert_equal [], Solution.new.inorder_traversal(nil)
  end

  def test_3
    i1 = TreeNode.new(1)

    assert_equal [1], Solution.new.inorder_traversal(i1)
  end
end
