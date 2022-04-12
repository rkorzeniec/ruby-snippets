# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

# Runtime: 124 ms, faster than 79.66% of Ruby online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
# Memory Usage: 211.9 MB, less than 69.49% of Ruby online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
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
    @preorder = preorder
    @inorder = inorder
    @preorder_index = 0
    @inonder_indexes = built_indexes_hash(inorder)

    build_tree_from_array(
      left: 0,
      right: preorder.size - 1
    )
  end

  def built_indexes_hash(array)
    hash = {}

    array.each_with_index do |num, i|
      hash[num] = i
    end

    hash
  end

  def build_tree_from_array(left:, right:)
    return if left > right

    root_value = @preorder[@preorder_index]
    node = TreeNode.new(root_value)

    @preorder_index += 1

    node.left = build_tree_from_array(left:, right: @inonder_indexes[root_value] - 1)
    node.right = build_tree_from_array(left: @inonder_indexes[root_value] + 1, right:)
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
