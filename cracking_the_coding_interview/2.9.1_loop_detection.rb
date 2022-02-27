# frozen_string_literal: true

# Given a circular linked list, implement an algorithm that returns the node at the
# beginning of the loop.

# DEFINITION
# Circular linked list: A (corrupt) linked list in which a node's next
# pointer points to an earlier node, so as to make a loop in the linked list.

# EXAMPLE
# Input: A -> B -> C -> D -> E -> C [the same C as earlier]
# Output: C

require 'minitest/autorun'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def cycle_node
    return nil if head.nil? || head.next.nil?

    nodes = []

    while head.next
      return head if nodes.include?(head)

      nodes.append(head)
      @head = head.next
    end

    nil
  end

  private

  attr_reader :head
end

class TestStringRotate < Minitest::Test
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
    i4 = Node.new(5)
    i3 = Node.new(4, i4)
    i2 = Node.new(3, i3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i4.next = i2

    assert_equal i2, LinkedList.new(i0).cycle_node
  end
end
