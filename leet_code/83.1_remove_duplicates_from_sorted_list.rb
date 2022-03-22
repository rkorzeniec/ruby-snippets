# frozen_string_literal: true

# https://leetcode.com/problems/remove-duplicates-from-sorted-list/

require_relative '../test_helper'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Runtime: 94 ms, faster than 73.76% of Ruby online submissions for Remove Duplicates from Sorted List.
# Memory Usage: 211.1 MB, less than 14.18% of Ruby online submissions for Remove Duplicates from Sorted List.
class Solution
  class << self
    def delete_duplicates(head)
      node = head
      back = nil
      front = nil

      while node
        front = node.next
        back = node

        if front && node.val == front.val
          front = front.next while front && node.val == front.val

          back.next = front
        end

        node = node.next
      end

      head
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    i3 = ListNode.new(2)
    i2 = ListNode.new(1, i3)
    i1 = ListNode.new(1, i2)

    assert_equal i1, Solution.delete_duplicates(i1)
    assert_equal i3, i1.next
  end

  def test_2
    i5 = ListNode.new(3)
    i4 = ListNode.new(3, i5)
    i3 = ListNode.new(2, i4)
    i2 = ListNode.new(1, i3)
    i1 = ListNode.new(1, i2)

    assert_equal i1, Solution.delete_duplicates(i1)
    assert_equal i3, i1.next
    assert_equal i4, i3.next
    assert_nil i4.next
  end

  def test_3
    i6 = ListNode.new(3)
    i5 = ListNode.new(3, i6)
    i4 = ListNode.new(2, i5)
    i3 = ListNode.new(1, i4)
    i2 = ListNode.new(1, i3)
    i1 = ListNode.new(1, i2)

    assert_equal i1, Solution.delete_duplicates(i1)
    assert_equal i4, i1.next
    assert_equal i5, i4.next
    assert_nil i5.next
  end

  def test_4
    i3 = ListNode.new(1)
    i2 = ListNode.new(1, i3)
    i1 = ListNode.new(1, i2)

    assert_equal i1, Solution.delete_duplicates(i1)
    assert_nil i1.next
  end
end
