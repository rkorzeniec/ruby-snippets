# frozen_string_literal: true

# https://leetcode.com/problems/middle-of-the-linked-list/

require 'minitest/autorun'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Runtime: 72 ms, faster than 80.66% of Ruby online submissions for Middle of the Linked List.
# Memory Usage: 210.9 MB, less than 58.01% of Ruby online submissions for Middle of the Linked List.
class Solution
  class << self
    def middle_node(head)
      front = head
      back = ListNode.new(-1, head)

      while front && front.next
        front = front.next.next
        back = back.next
      end

      back.next
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

    assert_equal i3, Solution.middle_node(i1)
  end

  def test_2
    i6 = ListNode.new(6)
    i5 = ListNode.new(5, i6)
    i4 = ListNode.new(4, i5)
    i3 = ListNode.new(3, i4)
    i2 = ListNode.new(2, i3)
    i1 = ListNode.new(1, i2)

    assert_equal i4, Solution.middle_node(i1)
  end
end
