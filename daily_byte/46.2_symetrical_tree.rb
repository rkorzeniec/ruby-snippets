# frozen_string_literal: true

# Given a binary tree, return whether or not it forms a reflection across its center
# (i.e. a line drawn straight down starting from the root).
# Note: a reflection is when an image, flipped across a specified line, forms the same image.

# Ex: Given the following tree…
#    2
#  /   \
# 1     1
# return true as when the tree is reflected across its center all the nodes match.

# Ex: Given the following tree…
#     1
#    / \
#   5   5
#    \    \
#     7    7
# return false as when the tree is reflected across its center the nodes containing sevens do not match.

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
  def symetrical?(root)
    return if root.nil?

    dfs(root.left, root.right)
  end

  def dfs(left, right)
    return left == right unless left && right

    left.val == right.val &&
      dfs(left.left, right.right) &&
      dfs(left.right, right.left)
  end
end

class Test < Minitest::Test
  def test_1
    n3 = Node.new(val: 1)
    n2 = Node.new(val: 1)
    n1 = Node.new(val: 2, left: n2, right: n3)

    assert_equal true, Solution.new.symetrical?(n1)
  end

  def test_2
    n5 = Node.new(val: 7)
    n4 = Node.new(val: 7)
    n3 = Node.new(val: 5, right: n5)
    n2 = Node.new(val: 5, right: n4)
    n1 = Node.new(val: 1, left: n2, right: n3)

    assert_equal false, Solution.new.symetrical?(n1)
  end
end
