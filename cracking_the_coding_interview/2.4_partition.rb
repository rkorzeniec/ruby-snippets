# frozen_string_literal: true

# Write code to partition a linked list around a value x,
# such that all nodes less than x come before all nodes greater than or equal to x.
#
# If x is contained within the list,
# the values of x only need to be after the elements less than x (see below).
#
# The partition element x can appear anywhere in the "right partition"
# it does not need to appear between the left and right partitions.
#
# EXAMPLE
# Input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition = 5]
# Output: 3 -> 1 -> 2 -> 5 -> 5 -> 8 -> 10

require 'minitest/autorun'
require 'set'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def partition(pivot)
    front = head
    rear = head
    node = head

    while node
      next_node = node.next

      if node.value < pivot
        node.next = front
        front = node
      else
        rear.next = node
        rear = node
      end

      node = next_node
    end

    rear.next = nil

    front
  end

  private

  attr_reader :head
end

class TestStringRotate < Minitest::Test
  def test_1
    i6 = Node.new(1)
    i5 = Node.new(2, i6)
    i4 = Node.new(10, i5)
    i3 = Node.new(5, i4)
    i2 = Node.new(8, i3)
    i1 = Node.new(5, i2)
    i0 = Node.new(3, i1)

    assert_equal i6, LinkedList.new(i0).partition(5)
    assert_equal i5, i6.next
    assert_equal i0, i5.next
    assert_equal i1, i0.next
    assert_equal i2, i1.next
    assert_equal i3, i2.next
    assert_equal i4, i3.next
    assert_nil i4.next
  end
end
