# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/binary-tree-postorder-traversal/

# Runtime: 68 ms, faster than 91.87% of Ruby online submissions for Binary Tree Postorder Traversal.
# Memory Usage: 211 MB, less than 69.11% of Ruby online submissions for Binary Tree Postorder Traversal.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def postorder_traversal(root)
    return [] if root.nil?

    list = []

    list += postorder_traversal(root.left) if root.left
    list += postorder_traversal(root.right) if root.right

    list.append(root.val)
  end
end

class Test < Minitest::Test
  def test_1
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1)

    i1.right = i2
    i2.left = i3

    assert_equal [3, 2, 1], Solution.new.postorder_traversal(i1)
  end

  def test_2
    assert_equal [], Solution.new.postorder_traversal(nil)
  end

  def test_3
    i1 = TreeNode.new(1)

    assert_equal [1], Solution.new.postorder_traversal(i1)
  end
end
