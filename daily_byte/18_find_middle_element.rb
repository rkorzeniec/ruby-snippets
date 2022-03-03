# frozen_string_literal: true

# This question is asked by Amazon.
# Given a non-empty linked list, return the middle node of the list.
# If the linked list contains an even number of elements, return the node closer to the end.
#
# 1 -> 2 -> 3 -> null, return 2
# 1 -> 2 -> 3 -> 4 -> null, return 3
# 1 -> null, return 1

require 'minitest/autorun'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def middle_node
    front = head
    back = head

    _front, back = fast_forward_list(front, back)

    back
  end

  private

  attr_reader :head

  def fast_forward_list(front, back)
    while front&.next
      front = front.next.next
      back = back.next
    end

    [front, back]
  end
end

class TestLinkedList < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i1, LinkedList.new(i0).middle_node
  end

  def test_2
    i3 = Node.new(4)
    i2 = Node.new(3, i3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i2, LinkedList.new(i0).middle_node
  end

  def test_3
    i0 = Node.new(1)

    assert_equal i0, LinkedList.new(i0).middle_node
  end
end
