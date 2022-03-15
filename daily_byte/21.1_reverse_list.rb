# frozen_string_literal: true

# This question is asked by Facebook.
# Given a linked list, containing unique values, reverse it, and return the result.
#
# Ex: Given the following linked lists...
# 1 -> 2 -> 3 -> null,
# return a reference to the node that contains 3 which points to a list that
# looks like the following: 3 -> 2 -> 1 -> null

# 7 -> 15 -> 9 -> 2 -> null,
# return a reference to the node that contains 2 which points to a list that
# looks like the following: 2 -> 9 -> 15 -> 7 -> null

# 1 -> null,
# return a reference to the node that contains 1 which points to a list that
# looks like the following: 1 -> null

require_relative '../test_helper'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def reverse
    stack = []
    node = head

    while node
      stack.append(node)
      node = node.next
    end

    head = node = stack.pop

    until stack.empty?
      temp = stack.pop
      node.next = temp
      node = node.next
    end

    node.next = nil

    head
  end

  private

  attr_reader :head
end

class TestLinkedList < Minitest::Test
  def test_1
    i0 = Node.new(1)

    assert_equal i0, LinkedList.new(i0).reverse
  end

  def test_2
    i3 = Node.new(2)
    i2 = Node.new(9, i3)
    i1 = Node.new(15, i2)
    i0 = Node.new(7, i1)

    assert_equal i3, LinkedList.new(i0).reverse
    assert_equal i2, i3.next
    assert_equal i1, i2.next
    assert_equal i0, i1.next
    assert_nil i0.next
  end

  def test_3
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i2, LinkedList.new(i0).reverse
    assert_equal i1, i2.next
    assert_equal i0, i1.next
    assert_nil i0.next
  end
end
