# frozen_string_literal: true

# Given a binary tree, return a list of strings containing all root to leaf paths.

# Ex: Given the following tree…
#    1
#  /   \
# 2     3
# return ["1->2", "1->3"]

# Ex: Given the following tree…
#     8
#    / \
#   2  29
#     /  \
#    3    9
# return ["8->2", "8->29->3", "8->29->9"]

require_relative '../test_helper'

class Node
  attr_accessor :val, :left, :right

  def initialize(val: 0, left: nil, right: nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def paths_to_leaf(root, path: '')
    return paths if root.nil?

    path = root.val.to_s if path.empty?
    left_paths = paths_to_leaf(root.left, path: "#{path}->#{root.left.val}") if root.left
    right_paths = paths_to_leaf(root.right, path: "#{path}->#{root.right.val}") if root.right

    paths = []
    paths.append(left_paths) if left_paths
    paths.append(right_paths) if right_paths
    paths.empty? ? path : paths.flatten
  end
end

class Test < Minitest::Test
  def test_1
    n3 = Node.new(val: 3)
    n2 = Node.new(val: 2)
    n1 = Node.new(val: 1, left: n2, right: n3)

    assert_equal ['1->2', '1->3'], Solution.new.paths_to_leaf(n1)
  end

  def test_2
    n5 = Node.new(val: 9)
    n4 = Node.new(val: 3)
    n3 = Node.new(val: 29, left: n4, right: n5)
    n2 = Node.new(val: 2)
    n1 = Node.new(val: 8, left: n2, right: n3)

    assert_equal ['8->2', '8->29->3', '8->29->9'], Solution.new.paths_to_leaf(n1)
  end
end
