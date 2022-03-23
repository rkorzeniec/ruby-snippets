# frozen_string_literal: true

# https://leetcode.com/problems/linked-list-cycle/

require_relative '../test_helper'
require 'set'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Runtime: 84 ms, faster than 90.91% of Ruby online submissions for Linked List Cycle.
# Memory Usage: 216.5 MB, less than 11.02% of Ruby online submissions for Linked List Cycle.
class Solution
  class << self
    def hasCycle(head)
      return false if head.nil?

      nodes = Set.new
      node = head

      while node
        return true if nodes.include?(node)

        nodes.add(node)
        node = node.next
      end

      false
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    i4 = ListNode.new(-4)
    i3 = ListNode.new(0, i4)
    i2 = ListNode.new(2, i3)
    i1 = ListNode.new(3, i2)
    i4.next = i2

    assert_equal true, Solution.hasCycle(i1)
  end

  def test_2
    i2 = ListNode.new(2)
    i1 = ListNode.new(3, i2)
    i2.next = i1

    assert_equal true, Solution.hasCycle(i1)
  end

  def test_3
    i1 = ListNode.new(1)

    assert_equal false, Solution.hasCycle(i1)
  end
end
