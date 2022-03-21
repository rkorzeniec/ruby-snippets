# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/implement-queue-using-stacks/

# Runtime: 96 ms, faster than 77.36% of Ruby online submissions for Implement Queue using Stacks.
# Memory Usage: 211.3 MB, less than 9.43% of Ruby online submissions for Implement Queue using Stacks.
class MyQueue
  def initialize
    @left_stack = []
    @right_stack = []
    @queue_mode = true
  end

  def push(x)
    move_to_left unless queue_mode?
    left_stack.append(x)
  end

  def pop
    move_to_right if queue_mode?
    right_stack.pop
  end

  def peek()
    move_to_right if queue_mode?
    right_stack.last
  end

  def empty()
    left_stack.empty? && right_stack.empty?
  end

  private

  attr_reader :left_stack, :right_stack, :queue_mode

  def queue_mode?
    queue_mode == true
  end

  def move_to_left
    until right_stack.empty?
      item = right_stack.pop
      left_stack.append(item)
    end

    @queue_mode = true
  end

  def move_to_right
    until left_stack.empty?
      item = left_stack.pop
      right_stack.append(item)
    end

    @queue_mode = false
  end
end

class Test < Minitest::Test
  def test_1
    queue = MyQueue.new

    queue.push(1)
    queue.push(2)
    queue.push(3)
    queue.push(4)
    queue.push(5)

    assert_equal [1, 2, 3, 4, 5], queue.send(:left_stack)
    assert_equal [], queue.send(:right_stack)

    assert_equal 1, queue.pop
    assert_equal [], queue.send(:left_stack)
    assert_equal [5, 4, 3, 2], queue.send(:right_stack)

    assert_equal 2, queue.pop
    assert_equal 3, queue.pop

    assert_equal [], queue.send(:left_stack)
    assert_equal [5, 4], queue.send(:right_stack)

    queue.push(1)
    assert_equal [4, 5, 1], queue.send(:left_stack)
    assert_equal [], queue.send(:right_stack)
  end
end
