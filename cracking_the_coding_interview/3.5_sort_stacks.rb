# frozen_string_literal: true

# Write a program to sort a stack such that the smallest items are on the top.
# You can use an additional temporary stack, but you may not copy the elements
# into any other data structure (such as an array).

# The stack supports the following operations: push, pop, peek, and isEmpty.

require 'minitest/autorun'

class Stack
  def initialize
    @left_stack = []
    @right_stack = []
    @queue_mode = false
  end

  def push(value)
    move_left if queue_mode?

    left_stack.append(value)
  end

  def pop
    move_right unless queue_mode?

    right_stack.pop
  end

  private

  attr_reader :left_stack, :right_stack, :queue_mode

  def queue_mode?
    queue_mode == true
  end

  def move_to_right
    until left_stack.empty?
      item = left_stack.pop
      right_stack.append(item)
    end

    @queue_mode = true
  end

  def move_to_left
    until right_stack.empty?
      item = right_stack.pop
      left_stack.append(item)
    end

    @queue_mode = false
  end
end

class TestStack < Minitest::Test
  def test_1
    queue = Stack.new

    queue.push(1)
    queue.push(2)
    queue.push(3)
    queue.push(4)
    queue.push(5)

    assert_equal [1, 2, 3, 4, 5], stack.send(:left_stack)
    assert_equal [], stack.send(:right_stack)

    assert_equal 1, stack.pop
    assert_equal [], stack.send(:left_stack)
    assert_equal [2, 3, 4, 5], stack.send(:right_stack)

    assert_equal 2, stack.pop
    assert_equal 3, stack.pop

    assert_equal [], stack.send(:left_stack)
    assert_equal [4, 5], stack.send(:right_stack)

    assert_equal 1, queue.push(1)
    assert_equal [4, 5, 1], stack.send(:left_stack)
    assert_equal [], stack.send(:right_stack)
  end
end
