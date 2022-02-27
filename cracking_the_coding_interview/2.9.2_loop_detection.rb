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

class Node
  attr_accessor :value, :next_node

  def initialize(value = 0, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(head)
    @head = head
  end

  def cycle_node
    return nil if head.nil? || head.next_node.nil?

    slow = fast = head
    fast = find_cycle(slow, fast)

    return nil if fast.nil? || fast.next_node.nil?

    slow = head

    find_cycle_head(slow, fast)
  end

  private

  attr_reader :head

  def find_cycle(slow, fast)
    while fast&.next_node
      slow = slow.next_node
      fast = fast.next_node.next_node

      break if fast == slow
    end

    fast
  end

  def find_cycle_head(slow, fast)
    while slow != fast
      slow = slow.next_node
      fast = fast.next_node
    end

    fast
  end
end

class TestStringRotate < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i2.next_node = i0

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
    i0.next_node = i0

    assert_equal i0, LinkedList.new(i0).cycle_node
  end

  def test_4
    i4 = Node.new(5)
    i3 = Node.new(4, i4)
    i2 = Node.new(3, i3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)
    i4.next_node = i2

    assert_equal i2, LinkedList.new(i0).cycle_node
  end
end
