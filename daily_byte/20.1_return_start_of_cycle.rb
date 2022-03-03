# frozen_string_literal: true

# This question is asked by Apple.
# Given a potentially cyclical linked list where each value is unique,
# return the node at which the cycle starts.
# If the list does not contain a cycle, return null.
#
# 1 -> 2 -> 3, return null
# 1 -> 2 -> 3 -> 4 -> 5 -> 2 (5 points back to 2), return a reference to the node containing 2
# 1 -> 9 -> 3 -> 7 -> 7 (7 points to itself), return a reference to the node containing 7

require 'minitest/autorun'
require 'set'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def cycle_node
    set = Set.new
    node = head

    while node
      return node if set.include?(node.value)

      set.add(node.value)
      node = node.next
    end

    nil
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

    assert_equal i0, LinkedList.new(i0).cycle_node
  end

  def test_2
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_nil LinkedList.new(i0).cycle_node
  end

  def test_3
    i0 = Node.new(1)
    i0.next = i0

    assert_equal i0, LinkedList.new(i0).cycle_node
  end

  def test_4
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i2.next = i0

    assert_equal i0, LinkedList.new(i0).cycle_node
  end

  def test_5
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_nil LinkedList.new(i0).cycle_node
  end

  def test_6
    i0 = Node.new(1)
    i0.next = i0

    assert_equal i0, LinkedList.new(i0).cycle_node
  end

  def test_7
    i4 = Node.new(5)
    i3 = Node.new(4, i4)
    i2 = Node.new(3, i3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i4.next = i2

    assert_equal i2, LinkedList.new(i0).cycle_node
  end

  def test_8
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_nil LinkedList.new(i0).cycle_node
  end

  def test_9
    i4 = Node.new(5)
    i3 = Node.new(4, i4)
    i2 = Node.new(3, i3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i4.next = i1

    assert_equal i1, LinkedList.new(i0).cycle_node
  end

  def test_10
    i3 = Node.new(7)
    i2 = Node.new(3, i3)
    i1 = Node.new(9, i2)
    i0 = Node.new(1, i1)
    i3.next = i3

    assert_equal i3, LinkedList.new(i0).cycle_node
  end
end
