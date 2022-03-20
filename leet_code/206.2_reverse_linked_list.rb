# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/reverse-linked-list

# Runtime: 84 ms, faster than 80.18% of Ruby online submissions for Reverse Linked List.
# Memory Usage: 211.3 MB, less than 23.72% of Ruby online submissions for Reverse Linked List.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

class LinkedList
  def reverse_list(head = nil)
    return head if head.nil? || head.next.nil?

    previous_node = nil
    current_node = head

    while current_node
      next_node = current_node.next
      current_node.next = previous_node

      previous_node = current_node
      current_node = next_node
    end

    previous_node
  end
end

class TestLinkedList < Minitest::Test
  def test_1
    i5 = ListNode.new(5)
    i4 = ListNode.new(4, i5)
    i3 = ListNode.new(3, i4)
    i2 = ListNode.new(2, i3)
    i1 = ListNode.new(1, i2)

    assert_equal i5, LinkedList.new.reverse_list(i1)
    assert_equal i4, i5.next
    assert_equal i3, i4.next
    assert_equal i2, i3.next
    assert_equal i1, i2.next
    assert_nil i1.next
  end

  def test_2
    i2 = ListNode.new(2)
    i1 = ListNode.new(1, i2)

    assert_equal i2, LinkedList.new.reverse_list(i1)
    assert_equal i1, i2.next
    assert_nil i1.next
  end

  def test_3
    assert_nil LinkedList.new.reverse_list
  end
end
