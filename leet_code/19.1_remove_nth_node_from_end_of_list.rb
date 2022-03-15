# frozen_string_literal: true

# https://leetcode.com/problems/remove-nth-node-from-end-of-list/

require_relative '../test_helper'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Runtime: 68 ms, faster than 88.53% of Ruby online submissions for Remove Nth Node From End of List.
# Memory Usage: 211.1 MB, less than 35.13% of Ruby online submissions for Remove Nth Node From End of List.
class Solution
  class << self
    def remove_nth_from_end(head, n)
      return nil if head.next.nil?

      front = head
      back = ListNode.new(-1, head)

      n.times { |_| front = front.next }

      return head.next if front.nil?

      while front
        front = front.next
        back = back.next
      end

      back.next = back.next.next

      head
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    i5 = ListNode.new(5)
    i4 = ListNode.new(4, i5)
    i3 = ListNode.new(3, i4)
    i2 = ListNode.new(2, i3)
    i1 = ListNode.new(1, i2)
    n = 2

    assert_equal i1, Solution.remove_nth_from_end(i1, n)
    assert_equal i2, i1.next
    assert_equal i3, i2.next
    assert_equal i5, i3.next
  end

  def test_2
    i1 = ListNode.new(1)
    n = 1

    assert_nil Solution.remove_nth_from_end(i1, n)
  end

  def test_3
    i2 = ListNode.new(2)
    i1 = ListNode.new(1, i2)
    n = 1

    assert_equal i1, Solution.remove_nth_from_end(i1, n)
    assert_nil i1.next
  end

  def test_4
    i2 = ListNode.new(2)
    i1 = ListNode.new(1, i2)
    n = 2

    assert_equal i2, Solution.remove_nth_from_end(i1, n)
    assert_nil i2.next
  end
end
