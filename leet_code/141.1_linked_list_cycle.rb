# frozen_string_literal: true

# https://leetcode.com/problems/linked-list-cycle/

require_relative '../test_helper'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Runtime: 109 ms, faster than 76.86% of Ruby online submissions for Linked List Cycle.
# Memory Usage: 212.3 MB, less than 39.67% of Ruby online submissions for Linked List Cycle.
class Solution
  class << self
    def hasCycle(head)
      return false if head.nil?

      front = head.next
      back = head

      while front&.next
        return true if back == front

        front = front.next.next
        back = back.next
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
