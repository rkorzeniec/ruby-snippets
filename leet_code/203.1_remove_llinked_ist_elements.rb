# frozen_string_literal: true

# https://leetcode.com/problems/remove-linked-list-elements/

require_relative '../test_helper'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Runtime: 122 ms, faster than 74.19% of Ruby online submissions for Remove Linked List Elements.
# Memory Usage: 212.2 MB, less than 80.65% of Ruby online submissions for Remove Linked List Elements.
class Solution
  class << self
    def remove_elements(head, val)
      return if head.nil?

      dummy = ListNode.new(0, head)
      back = dummy
      front = head

      while front
        if val == front.val
          front = front.next while front && front.val == val
          back.next = front

          break unless front
        end

        back = back.next
        front = front.next
      end

      dummy.next
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    i7 = ListNode.new(6)
    i6 = ListNode.new(5, i7)
    i5 = ListNode.new(4, i6)
    i4 = ListNode.new(3, i5)
    i3 = ListNode.new(6, i4)
    i2 = ListNode.new(2, i3)
    i1 = ListNode.new(1, i2)

    val = 6

    assert_equal i1, Solution.remove_elements(i1, val)
    assert_equal i2, i1.next
    assert_equal i4, i2.next
    assert_equal i5, i4.next
    assert_equal i6, i5.next
    assert_nil i6.next
  end

  def test_2
    val = 1

    assert_nil Solution.remove_elements(nil, val)
  end

  def test_3
    i4 = ListNode.new(7)
    i3 = ListNode.new(7, i4)
    i2 = ListNode.new(7, i3)
    i1 = ListNode.new(7, i2)

    val = 7

    assert_nil Solution.remove_elements(i1, val)
  end
end
