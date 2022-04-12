# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

# Runtime: 88 ms, faster than 93.22% of Ruby online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
# Memory Usage: 212.5 MB, less than 10.17% of Ruby online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def build_tree(preorder, inorder)
    return if preorder.nil? || inorder.nil?

    node = TreeNode.new(preorder[0])
    root_idx = inorder.index(node.val)
    return if root_idx.nil?

    node.left = build_tree(preorder[1..root_idx], inorder[0...root_idx])
    node.right = build_tree(preorder[root_idx + 1..], inorder[root_idx + 1..])
    node
  end
end

class Test < Minitest::Test
  def test_1
    preorder = [3, 9, 20, 15, 7]
    inorder = [9, 3, 15, 20, 7]

    root = Solution.new.build_tree(preorder, inorder)

    assert_equal 3, root.val
    assert_equal 9, root.left.val
    assert_equal 20, root.right.val
    assert_equal 15, root.right.left.val
    assert_equal 7, root.right.right.val
  end

  def test_2
    preorder = [-1]
    inorder = [-1]

    assert_equal -1, Solution.new.build_tree(preorder, inorder).val
  end

  def test_3
    preorder = [1, 2]
    inorder = [1, 2]

    root = Solution.new.build_tree(preorder, inorder)

    assert_equal 1, root.val
    assert_nil root.left
    assert_equal 2, root.right.val
  end
end
