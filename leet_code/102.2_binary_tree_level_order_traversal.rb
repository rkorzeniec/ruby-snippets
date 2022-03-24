# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/binary-tree-level-order-traversal/


class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# Runtime: 68 ms, faster than 93.89% of Ruby online submissions for Binary Tree Level Order Traversal.
# Memory Usage: 211.1 MB, less than 12.78% of Ruby online submissions for Binary Tree Level Order Traversal.
class Solution
  def level_order(root)
    return [] if root.nil?

    result = []
    queue = [root]

    until queue.empty?
      result.append(queue.map(&:val))

      temp = []
      queue.each { |n| temp.append(n.left, n.right) }
      queue = temp.filter_map { |n| n unless n.nil? }
    end

    result
  end
end

class Test < Minitest::Test
  def test_1
    i5 = TreeNode.new(7)
    i4 = TreeNode.new(15)
    i3 = TreeNode.new(20, i4, i5)
    i2 = TreeNode.new(9)
    i1 = TreeNode.new(3, i2, i3)

    assert_equal [[3],[9,20],[15,7]], Solution.new.level_order(i1)
  end

  def test_2
    assert_equal [], Solution.new.level_order(nil)
  end

  def test_3
    i1 = TreeNode.new(1)

    assert_equal [[1]], Solution.new.level_order(i1)
  end
end
