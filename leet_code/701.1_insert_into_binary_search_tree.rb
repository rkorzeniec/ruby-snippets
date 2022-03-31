# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/insert-into-a-binary-search-tree/

# Runtime: 128 ms, faster than 85.37% of Ruby online submissions for Insert into a Binary Search Tree.
# Memory Usage: 213.9 MB, less than 41.46% of Ruby online submissions for Insert into a Binary Search Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def insert_into_bst(root, val)
    return TreeNode.new(val) if root.nil?

    if val < root.val
      root.left = insert_into_bst(root.left, val)
    else
      root.right = insert_into_bst(root.right, val)
    end

    root
  end

  def pretty_print(node, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.val}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

class Test < Minitest::Test
  def test_1
    i5 = TreeNode.new(3)
    i4 = TreeNode.new(1)
    i3 = TreeNode.new(7)
    i2 = TreeNode.new(2, i4, i5)
    i1 = TreeNode.new(4, i2, i3)

    Solution.new.pretty_print(i1)

    assert_equal i1, Solution.new.insert_into_bst(i1, 5)

    Solution.new.pretty_print(i1)
  end

  def test_2
    i7 = TreeNode.new(70)
    i6 = TreeNode.new(50)
    i5 = TreeNode.new(30)
    i4 = TreeNode.new(10)
    i3 = TreeNode.new(60, i6, i7)
    i2 = TreeNode.new(20, i4, i5)
    i1 = TreeNode.new(40, i2, i3)

    Solution.new.pretty_print(i1)

    assert_equal i1, Solution.new.insert_into_bst(i1, 25)

    Solution.new.pretty_print(i1)
  end
end
