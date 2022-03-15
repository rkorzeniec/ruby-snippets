# frozen_string_literal: true

# Write code to remove duplicates from an unsorted linked list.
# How would you solve this problem if a temporary buffer is not allowed?

require_relative '../test_helper'
require 'set'

Node = Struct.new('Node', :value, :next)

class LinkedList
  def initialize(head)
    @head = head
  end

  def dedup
    node = head
    runner = nil
    previous = nil

    while node
      runner = node.next
      previous = node

      while runner
        previous.next = runner.next if node.value == runner.value

        runner = runner.next
        previous = previous.next
      end

      node = node.next
    end

    head
  end

  private

  attr_reader :head
end

class TestStringRotate < Minitest::Test
  def test_1
    i2 = Node.new(3)
    i1 = Node.new(2, i2)
    i0 = Node.new(1, i1)

    assert_equal i0, LinkedList.new(i0).dedup
    assert_equal i1, i0.next
    assert_equal i2, i1.next
    assert_nil i2.next
  end

  def test_2
    i4 = Node.new(12)
    i3 = Node.new(1, i4)
    i2 = Node.new(4, i3)
    i1 = Node.new(1, i2)
    i0 = Node.new(8, i1)

    assert_equal i0, LinkedList.new(i0).dedup
    assert_equal i1, i0.next
    assert_equal i2, i1.next
    assert_equal i4, i2.next
    assert_nil i4.next
  end

  def test_3
    i3 = Node.new(7)
    i2 = Node.new(2, i3)
    i1 = Node.new(12, i2)
    i0 = Node.new(7, i1)

    assert_equal i0, LinkedList.new(i0).dedup
    assert_equal i1, i0.next
    assert_equal i2, i1.next
    assert_nil i2.next
  end
end
