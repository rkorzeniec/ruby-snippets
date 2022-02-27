# frozen_string_literal: true

# Given two (singly) linked lists, determine if the two lists intersect.
# Return the inter­secting node.
#
# Note that the intersection is defined based on reference, not value.
#
# That is, if the kth node of the first linked list is the exact same node
# (by reference) as the jth node of the second linked list,
# then they are intersecting.

require 'minitest/autorun'

TailNode = Struct.new('TailNode', :span, :node, keyword_init: true)

class Node
  attr_reader :value, :next_node

  def initialize(value = 0, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(list1, list2)
    @list1 = list1
    @list2 = list2
  end

  def intersection
    list1_tail = tail(list1)
    list2_tail = tail(list2)

    return nil unless list1_tail.node == list2_tail.node

    list1_head = list1
    list2_head = list2

    list1_head, list2_head = travel_lists(list1_head, list1_tail, list2_head, list2_tail)

    while list1_head && list2_head
      return list1_head if list1_head == list2_head

      list1_head = list1_head.next_node
      list2_head = list2_head.next_node
    end

    nil
  end

  private

  attr_reader :list1, :list2

  def tail(list)
    count = 0

    while list
      count += 1
      list = list.next_node
    end

    TailNode.new(span: count, node: list)
  end

  def travel_lists(node1, tail1, node2, tail2)
    if tail1.span > tail2.span
      node1 = travel(node1, tail1.span - tail2.span)
    else
      node2 = travel(node2, tail2.span - tail1.span)
    end

    [node1, node2]
  end

  def travel(node, number)
    number.times { node = node.next_node }
    node
  end
end

class TestStringRotate < Minitest::Test
  def test_1
    i5 = Node.new(0)
    i4 = Node.new(1, i5)
    i3 = Node.new(2, i4)
    i2 = Node.new(2, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(0, i1)

    j2 = Node.new(2, i3)
    j1 = Node.new(1, j2)
    j0 = Node.new(0, j1)

    assert_equal i3, LinkedList.new(i0, j0).intersection
  end

  def test_2
    i6 = Node.new(0)
    i5 = Node.new(1, i6)
    i4 = Node.new(2, i5)
    i3 = Node.new(3, i4)
    i2 = Node.new(2, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(0, i1)

    j1 = Node.new(6, i5)
    j0 = Node.new(4, j1)

    assert_equal i5, LinkedList.new(i0, j0).intersection
  end

  def test_3
    i3 = Node.new(3)
    i2 = Node.new(2, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(0, i1)

    j3 = Node.new(3)
    j2 = Node.new(2, j3)
    j1 = Node.new(1, j2)
    j0 = Node.new(0, j1)

    assert_nil LinkedList.new(i0, j0).intersection
  end

  def test_4
    i4 = Node.new(4)
    i3 = Node.new(3, i4)
    i2 = Node.new(2, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(0, i1)

    j3 = Node.new(3)
    j2 = Node.new(2, j3)
    j1 = Node.new(1, j2)
    j0 = Node.new(0, j1)

    assert_nil LinkedList.new(i0, j0).intersection
  end
end
