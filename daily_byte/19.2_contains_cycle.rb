# frozen_string_literal: true

# This question is asked by Microsoft.
# Given a linked list, containing unique numbers, return whether or not it has a cycle.
# Note: a cycle is a circular arrangement(i.e. one node points back to a previous node)
#
# 1 -> 2 -> 3 -> 1 -> true (3 points back to 1)
# 1 -> 2 -> 3 -> false
# 1 -> 1 true (1 points to itself)

require_relative '../test_helper'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def cycle?
    front = head
    back = head

    while front&.next
      return true if front == back

      front = front.next.next
      back = back.next
    end

    false
  end

  private

  attr_reader :head
end

class TestLinkedList < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i2.next = i0

    assert_equal true, LinkedList.new(i0).cycle?
  end

  def test_2
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal false, LinkedList.new(i0).cycle?
  end

  def test_3
    i0 = Node.new(1)
    i0.next = i0

    assert_equal true, LinkedList.new(i0).cycle?
  end

  def test_4
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i2.next = i0

    assert_equal true, LinkedList.new(i0).cycle?
  end

  def test_5
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal false, LinkedList.new(i0).cycle?
  end

  def test_6
    i0 = Node.new(1)
    i0.next = i0

    assert_equal true, LinkedList.new(i0).cycle?
  end

  def test_7
    i4 = Node.new(5)
    i3 = Node.new(4, i4)
    i2 = Node.new(3, i3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i4.next = i2

    assert_equal true, LinkedList.new(i0).cycle?
  end
end
