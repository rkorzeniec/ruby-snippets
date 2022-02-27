# frozen_string_literal: true

# Implement a function to check if a linked list is a palindrome.

require 'minitest/autorun'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def palindrome?
    stack = []

    slow = head
    fast = head

    while fast&.next
      stack.append(slow.value)
      slow = slow.next
      fast = fast.next.next
    end

    slow = slow.next if fast

    while slow
      return false if slow.value != stack.pop

      slow = slow.next
    end

    true
  end

  private

  attr_reader :head
end

class TestStringRotate < Minitest::Test
  def test_1
    i5 = Node.new(0)
    i4 = Node.new(1, i5)
    i3 = Node.new(2, i4)
    i2 = Node.new(2, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(0, i1)

    assert_equal true, LinkedList.new(i0).palindrome?
  end

  def test_2
    i6 = Node.new(0)
    i5 = Node.new(1, i6)
    i4 = Node.new(2, i5)
    i3 = Node.new(3, i4)
    i2 = Node.new(2, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(0, i1)

    assert_equal true, LinkedList.new(i0).palindrome?
  end

  def test_3
    i3 = Node.new(3)
    i2 = Node.new(2, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(0, i1)

    assert_equal false, LinkedList.new(i0).palindrome?
  end
end
