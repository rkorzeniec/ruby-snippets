# frozen_string_literal: true

# You have two numbers represented by a linked list,
# where each node contains a single digit.
#
# The digits are stored in reverse order,
# such that the 1's digit is at the head of the list.
#
# Write a function that adds the two numbers and returns the sum as a linked list.
#
# EXAMPLE
# Input: (7 -> 1 -> 6) + (5 -> 9 -> 2). That is, 617 + 295.
# Output: 2 -> 1 -> 9. That is, 912.

require 'minitest/autorun'
require 'set'

Node = Struct.new('Node', :value, :next)

class LinkedListSum
  def initialize(head, other_head)
    @head = head
    @other_head = other_head
    @result_head = Node.new
    @carry = 0
  end

  def sum
    result = result_head

    while itterate?
      sum_node = Node.new
      result.next = sum_node

      sum = carry

      if head
        sum += head.value
        @head = head.next
      end

      if other_head
        sum += other_head.value
        @other_head = other_head.next
      end

      @carry = sum / 10
      sum_node.value = sum % 10
      result = sum_node
    end

    result_head.next
  end

  private

  attr_reader :head, :other_head, :result_head, :carry

  def itterate?
    (head && other_head) || carry >= 1
  end
end

class TestStringRotate < Minitest::Test
  # Input: (7 -> 1 -> 6) + (5 -> 9 -> 2). That is, 617 + 295.
  # Output: 2 -> 1 -> 9. That is, 912.
  def test_1
    j2 = Node.new(2)
    j1 = Node.new(9, j2)
    j0 = Node.new(5, j1)

    i2 = Node.new(6)
    i1 = Node.new(1, i2)
    i0 = Node.new(7, i1)

    result = LinkedListSum.new(i0, j0).sum
    assert_equal 2, result.value

    result = result.next
    assert_equal 1, result.value

    result = result.next
    assert_equal 9, result.value

    assert_nil result.next
  end

  # Input: (6 -> 1 -> 7) + (2 -> 9 -> 5). That is, 716 + 592.
  # Output: 8 -> 0 -> 3 -> 1. That is, 1308.
  def test_2
    j2 = Node.new(5)
    j1 = Node.new(9, j2)
    j0 = Node.new(2, j1)

    i2 = Node.new(7)
    i1 = Node.new(1, i2)
    i0 = Node.new(6, i1)

    result = LinkedListSum.new(i0, j0).sum
    assert_equal 8, result.value

    result = result.next
    assert_equal 0, result.value

    result = result.next
    assert_equal 3, result.value

    result = result.next
    assert_equal 1, result.value

    assert_nil result.next
  end
end
