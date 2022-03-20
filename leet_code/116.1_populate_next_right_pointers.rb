# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/populating-next-right-pointers-in-each-node/

# Runtime: 104 ms, faster than 90.76% of Ruby online submissions for Populating Next Right Pointers in Each Node.
# Memory Usage: 246.7 MB, less than 47.90% of Ruby online submissions for Populating Next Right Pointers in Each Node.
class Node
  attr_accessor :val, :left, :right, :next

  def initialize(val)
    @val = val
    @left, @right, @next = nil, nil, nil
  end
end

class Solution
  def connect(root)
    node = root

    while node&.left
      next_node = node.left

      while node
        node.left.next = node.right
        node.right.next = node.next.left if node.next
        node = node.next
      end

      node = next_node
    end

    root
  end
end

class Test < Minitest::Test
  def test_1
    i7 = Node.new(7)
    i6 = Node.new(6)
    i5 = Node.new(5)
    i4 = Node.new(4)
    i3 = Node.new(3)
    i2 = Node.new(2)
    i1 = Node.new(1)

    i1.left = i2
    i1.right = i3

    i2.left = i4
    i2.right = i5

    i3.left = i6
    i3.right = i7

    Solution.new.connect(i1)

    assert_nil i1.next

    assert_equal i3, i2.next
    assert_nil i3.next

    assert_equal i5, i4.next
    assert_equal i6, i5.next
    assert_equal i7, i6.next
    assert_nil i7.next
  end

  def test_2
    assert_nil Solution.new.connect(nil)
  end
end
