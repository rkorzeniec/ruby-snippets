# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/merge-k-sorted-lists/

# Time Limit Exceeded
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

class LinkedList
  def merge_k_lists(lists)
    return if lists.nil?

    dummy = ListNode.new
    node = dummy

    until lists.all?(&:nil?)
      current_node = lists.compact.min_by(&:val)

      node.next = current_node
      node = node.next

      current_node_index = lists.find_index(current_node)
      lists[current_node_index] = lists[current_node_index].next
    end

    dummy.next
  end
end

class Test < Minitest::Test
  def test_1
    i3 = ListNode.new(5)
    i2 = ListNode.new(4, i3)
    i1 = ListNode.new(1, i2)

    j3 = ListNode.new(4)
    j2 = ListNode.new(3, j3)
    j1 = ListNode.new(1, j2)

    k3 = ListNode.new(4)
    k2 = ListNode.new(3, k3)
    k1 = ListNode.new(2, k2)

    lists = [i1, j1, k1]

    assert_equal i1, LinkedList.new.merge_k_lists(lists)
    assert_equal j1, i1.next
    assert_equal k1, j1.next
    assert_equal j2, k1.next
    assert_equal k2, j2.next
    assert_equal i2, k2.next
    assert_equal j3, i2.next
    assert_equal k3, j3.next
    assert_equal i3, k3.next
    assert_nil i3.next
  end

  def test_2
    lists = []

    assert_nil LinkedList.new.merge_k_lists(lists)
  end

  def test_3
    lists = [nil]

    assert_nil LinkedList.new.merge_k_lists(lists)
  end

  def test_4
    i1 = ListNode.new(1)
    lists = [nil, i1]

    assert_equal i1, LinkedList.new.merge_k_lists(lists)
  end
end
