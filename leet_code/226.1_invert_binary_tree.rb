# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/invert-binary-tree/

# Runtime: 64 ms, faster than 95.60% of Ruby online submissions for Invert Binary Tree.
# Memory Usage: 211.1 MB, less than 12.09% of Ruby online submissions for Invert Binary Tree.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def invert_tree(root)
    return if root.nil?

    invert_tree(root.left) if root.left
    invert_tree(root.right) if root.right

    root.left, root.right = root.right, root.left
    root
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.val}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

class Test < Minitest::Test
  def test_1
    i7 = TreeNode.new(9)
    i6 = TreeNode.new(6)
    i5 = TreeNode.new(3)
    i4 = TreeNode.new(1)
    i3 = TreeNode.new(7, i6, i7)
    i2 = TreeNode.new(2, i4, i5)
    i1 = TreeNode.new(4, i2, i3)

    Solution.new.pretty_print(i1)

    Solution.new.invert_tree(i1)

    Solution.new.pretty_print(i1)

    assert_equal i3, i1.left
    assert_equal i2, i1.right

    assert_equal i5, i2.left
    assert_equal i4, i2.right

    assert_equal i7, i3.left
    assert_equal i6, i3.right
  end

  def test_2
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(1)
    i1 = TreeNode.new(2, i2, i3)

    Solution.new.pretty_print(i1)

    Solution.new.invert_tree(i1)

    Solution.new.pretty_print(i1)

    assert_equal i3, i1.left
    assert_equal i2, i1.right
  end
end
