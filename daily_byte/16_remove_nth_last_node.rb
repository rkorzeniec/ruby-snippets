# frozen_string_literal: true

# This question is asked by Facebook.
# Given a linked list and a value n,
# remove the nth to last node and return the resulting list.
#
# 1 -> 2 -> 3 -> null, n = 1, return 1 -> 2 -> null
# 1 -> 2 -> 3 -> null, n = 2, return 1 -> 3 -> null
# 1 -> 2 -> 3 -> null, n = 3, return 2 -> 3 -> null

require_relative '../test_helper'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def remove_nth(index)
    dummy_node = Node.new(0, head)
    front = head
    back = dummy_node

    (index - 1).times { |_| front = front.next }

    while front.next
      back = back.next
      front = front.next
    end

    back.next = back.next.next

    dummy_node.next
  end

  private

  attr_reader :head
end

class TestLinkedList < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i0, LinkedList.new(i0).remove_nth(1)
    assert_equal i1, i0.next
    assert_nil i1.next
  end

  def test_2
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i0, LinkedList.new(i0).remove_nth(2)
    assert_equal i2, i0.next
    assert_nil i2.next
  end

  def test_3
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i1, LinkedList.new(i0).remove_nth(3)
    assert_equal i2, i1.next
    assert_nil i2.next
  end
end
