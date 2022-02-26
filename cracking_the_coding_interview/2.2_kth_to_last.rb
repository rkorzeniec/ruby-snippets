# frozen_string_literal: true

# Implement an algorithm to find the kth to last element of a singly linked list.

require 'minitest/autorun'
require 'set'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def kth_to_last(index)
    front = head
    back = head

    index.times { front = front.next }

    while front.next
      front = front.next
      back = back.next
    end

    back
  end

  private

  attr_reader :head
end

class TestStringRotate < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i2, LinkedList.new(i0).kth_to_last(0)
  end

  def test_2
    i4 = Node.new(12)
    i3 = Node.new(1, i4)
    i2 = Node.new(4, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(8, i1)

    assert_equal i2, LinkedList.new(i0).kth_to_last(2)
  end

  def test_3
    i3 = Node.new(7)
    i2 = Node.new(2, i3)
    i1 = Node.new(12, i2)
    i0 = Node.new(7, i1)

    assert_equal i0, LinkedList.new(i0).kth_to_last(3)
  end
end
