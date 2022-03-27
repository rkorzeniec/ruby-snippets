# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/two-sum-iv-input-is-a-bst/

# Runtime: 100 ms, faster than 80.65% of Ruby online submissions for Two Sum IV - Input is a BST.
# Memory Usage: 212.8 MB, less than 96.77% of Ruby online submissions for Two Sum IV - Input is a BST.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def find_target(root, k)
    @cache = {}
    dfs(root, k)
  end

  def dfs(node, target)
    return false if node.nil?

    remaining = target - node.val

    return true if @cache.include?(remaining)

    @cache[node.val] = node

    dfs(node.left, target) || dfs(node.right, target)
  end
end

class Test < Minitest::Test
  def test_1
    i6 = TreeNode.new(7)
    i5 = TreeNode.new(4)
    i4 = TreeNode.new(2)
    i3 = TreeNode.new(6, nil, i6)
    i2 = TreeNode.new(3, i4, i5)
    i1 = TreeNode.new(5, i2, i3)

    k = 9

    assert_equal true, Solution.new.find_target(i1, k)
  end

  def test_2
    i6 = TreeNode.new(7)
    i5 = TreeNode.new(4)
    i4 = TreeNode.new(2)
    i3 = TreeNode.new(6, nil, i6)
    i2 = TreeNode.new(3, i4, i5)
    i1 = TreeNode.new(5, i2, i3)

    k = 28

    assert_equal false, Solution.new.find_target(i1, k)
  end
end
