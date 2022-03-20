# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/merge-two-sorted-lists/

# Runtime: 64 ms, faster than 96.32% of Ruby online submissions for Merge Two Sorted Lists.
# Memory Usage: 211.2 MB, less than 20.15% of Ruby online submissions for Merge Two Sorted Lists.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

class LinkedList
  def merge_two_lists(list1, list2)
    return if list1.nil? && list2.nil?

    dummy = ListNode.new
    node = dummy

    while list1 || list2
      if list1.nil?
        node.next = list2
        list2 = list2.next
      elsif list2.nil?
        node.next = list1
        list1 = list1.next
      elsif list1.val <= list2.val
        node.next = list1
        list1 = list1.next
      else
        node.next = list2
        list2 = list2.next
      end

      node = node.next
    end

    dummy.next
  end
end

class TestLinkedList < Minitest::Test
  def test_1
    i4 = ListNode.new(4)
    i2 = ListNode.new(2, i4)
    i1 = ListNode.new(1, i2)

    j4 = ListNode.new(4)
    j3 = ListNode.new(3, j4)
    j1 = ListNode.new(1, j3)

    assert_equal i1, LinkedList.new.merge_two_lists(i1, j1)
    assert_equal j1, i1.next
    assert_equal i2, j1.next
    assert_equal j3, i2.next
    assert_equal i4, j3.next
    assert_equal j4, i4.next
    assert_nil j4.next
  end

  def test_2
    i1 = nil
    j1 = nil

    assert_nil LinkedList.new.merge_two_lists(i1, j1)
  end

  def test_3
    i1 = nil
    j1 = ListNode.new(0)

    assert_equal j1, LinkedList.new.merge_two_lists(i1, j1)
    assert_nil j1.next
  end
end
