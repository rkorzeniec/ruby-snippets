# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/merge-two-binary-trees/

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def merge_trees(root1, root2)
    stack = [[root1, root2]]

    until stack.empty?
      node1, node2 = stack.pop

      next if node1.nil? || node2.nil?

      node1.val += node2.val

      if node1.left.nil?
        node1.left = node2.left
      else
        stack.append([node1.left, node2.left])
      end

      if node1.right.nil?
        node1.right = node2.right
      else
        stack.append([node1.right, node2.right])
      end
    end

    root1
  end
end

class Test < Minitest::Test
   def test_1
    i5 = TreeNode.new(5)
    i3 = TreeNode.new(3)
    i2 = TreeNode.new(2)
    i1 = TreeNode.new(1)

    j7 = TreeNode.new(7)
    j4 = TreeNode.new(4)
    j3 = TreeNode.new(3)
    j2 = TreeNode.new(2)
    j1 = TreeNode.new(1)

    i1.left = i3
    i1.right = i2
    i3.left = i5

    j2.left = j1
    j2.right = j3
    j1.right = j4
    j3.right = j7

    root = Solution.new.merge_trees(i1, j2)

    assert_equal 3, root.val
    assert_equal 4, root.left.val
    assert_equal 5, root.right.val

    assert_equal 5, root.left.left.val
    assert_equal 4, root.left.right.val
    assert_nil root.right.left
    assert_equal 7, root.right.right.val
  end

  def test_2
    i1 = TreeNode.new(1)

    j2 = TreeNode.new(2)
    j1 = TreeNode.new(1)

    j1.left = j2

    root = Solution.new.merge_trees(i1, j1)

    assert_equal 2, root.val
    assert_equal 2, root.left.val
    assert_nil root.right
  end
end
