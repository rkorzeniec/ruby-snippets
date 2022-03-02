# frozen_string_literal: true

# This question is asked by Apple.

# Given two sorted linked lists, merge them together in ascending order
# and return a reference to the merged list

require 'minitest/autorun'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def merge!(other_head)
    dummy_node = Node.new
    node = dummy_node

    while head && other_head
      if head.value <= other_head.value
        node.next = head
        @head = head.next
      else
        node.next = other_head
        other_head = other_head.next
      end

      node = node.next
    end

    if head
      node.next = head
    elsif other_head
      node.next = other_head
    end

    dummy_node.next
  end

  private

  attr_reader :head
end

class TestLinkedList < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    j2 = Node.new(6)
    j1 = Node.new(5, j2)
    j0 = Node.new(4, j1)

    assert_equal i0, LinkedList.new(i0).merge!(j0)
    assert_equal i1, i0.next
    assert_equal i2, i1.next
    assert_equal j0, i2.next
    assert_equal j1, j0.next
    assert_equal j2, j1.next
    assert_nil j2.next
  end

  def test_2
    i2 = Node.new(5)
    i1 = Node.new(3, i2)
    i0 = Node.new(1, i1)

    j2 = Node.new(6)
    j1 = Node.new(4, j2)
    j0 = Node.new(2, j1)

    assert_equal i0, LinkedList.new(i0).merge!(j0)
    assert_equal j0, i0.next
    assert_equal i1, j0.next
    assert_equal j1, i1.next
    assert_equal i2, j1.next
    assert_equal j2, i2.next
    assert_nil j2.next
  end

  def test_3
    i2 = Node.new(7)
    i1 = Node.new(4, i2)
    i0 = Node.new(4, i1)

    j2 = Node.new(6)
    j1 = Node.new(5, j2)
    j0 = Node.new(1, j1)

    assert_equal j0, LinkedList.new(i0).merge!(j0)
    assert_equal i0, j0.next
    assert_equal i1, i0.next
    assert_equal j1, i1.next
    assert_equal j2, j1.next
    assert_equal i2, j2.next
    assert_nil i2.next
  end

  def test_4
    i2 = Node.new(5)
    i1 = Node.new(3, i2)
    i0 = Node.new(1, i1)

    j1 = Node.new(4)
    j0 = Node.new(2, j1)

    assert_equal i0, LinkedList.new(i0).merge!(j0)
    assert_equal j0, i0.next
    assert_equal i1, j0.next
    assert_equal j1, i1.next
    assert_equal i2, j1.next
    assert_nil i2.next
  end

  def test_5
    i1 = Node.new(3)
    i0 = Node.new(1, i1)

    j2 = Node.new(6)
    j1 = Node.new(4, j2)
    j0 = Node.new(2, j1)

    assert_equal i0, LinkedList.new(i0).merge!(j0)
    assert_equal j0, i0.next
    assert_equal i1, j0.next
    assert_equal j1, i1.next
    assert_equal j2, j1.next
    assert_nil j2.next
  end
end
