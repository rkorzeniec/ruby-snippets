# frozen_string_literal: true

# Implement an algorithm to delete a node in the middle
# (i.e., any node but the first and last node, not necessarily the exact middle)
# of a singly linked list, given only access to that node.
#
# EXAMPLE
# Input: the node c from the linked list a -> b -> c -> d -> e -> f
# Result: nothing is returned, but the new linked list looks like a -> b -> d -> e -> f

require_relative '../test_helper'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def delete_mid_node
    return false if head.nil? || head.next.nil?

    head.value = head.next.value
    head.next = head.next.next

    true
  end

  private

  attr_reader :head
end

class TestStringRotate < Minitest::Test
  def test_1
    i5 = Node.new(6)
    i4 = Node.new(5, i5)
    i3 = Node.new(4, i4)
    i2 = Node.new(3, i3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal true, LinkedList.new(i2).delete_mid_node
    assert_equal i1, i0.next
    assert_equal i3, i1.next
    assert_equal i4, i3.next
    assert_equal i5, i4.next
    assert_nil i5.next
  end

  def test_2
    assert_equal false, LinkedList.new(nil).delete_mid_node
  end

  def test_3
    i1 = Node.new(2)
    i0 = Node.new(1, i1)

    assert_equal false, LinkedList.new(i1).delete_mid_node
    assert_equal i1, i0.next
    assert_nil i1.next
  end
end
