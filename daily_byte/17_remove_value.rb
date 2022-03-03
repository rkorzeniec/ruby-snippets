# frozen_string_literal: true

# This question is asked by Google.
# Given a linked list and a value, remove all nodes containing the provided value,
# and return the resulting list.
#
# 1 -> 2 -> 3 -> null, value = 3, return 1 -> 2 -> null
# 8 -> 1 -> 1 -> 4 -> 12 -> null, value = 1, return 8 -> 4 -> 12 -> null
# 7 -> 12 -> 2 -> 9 -> null, value = 7, return 12 -> 2 -> 9 -> null

require 'minitest/autorun'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def remove_value(value)
    return head.next if head.value == value

    node = head
    back = Node.new(0, head)

    while node
      node = fast_forward_node(node, value) if node.value == value

      back.next = node
      back = back.next

      node = node.next if node
    end

    head
  end

  private

  attr_reader :head

  def fast_forward_node(node, value)
    node = node.next while node && node.value == value

    node
  end
end

class TestLinkedList < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i0, LinkedList.new(i0).remove_value(3)
    assert_equal i1, i0.next
    assert_nil i1.next
  end

  def test_2
    i4 = Node.new(12)
    i3 = Node.new(4, i4)
    i2 = Node.new(1, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(8, i1)

    assert_equal i0, LinkedList.new(i0).remove_value(1)
    assert_equal i3, i0.next
    assert_equal i4, i3.next
    assert_nil i4.next
  end

  def test_3
    i3 = Node.new(9)
    i2 = Node.new(2, i3)
    i1 = Node.new(12, i2)
    i0 = Node.new(7, i1)

    assert_equal i1, LinkedList.new(i0).remove_value(7)
    assert_equal i2, i1.next
    assert_equal i3, i2.next
    assert_nil i3.next
  end
end
