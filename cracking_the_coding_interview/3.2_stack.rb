# frozen_string_literal: true

# How would you design a stack which, in addition to push and pop,
# has a function min which returns the minimum element?
# Push, pop and min should all operate in 0(1) time.

require_relative '../test_helper'

class Stack
  def initialize
    @stack = []
    @mins = []
  end

  def push(value)
    mins.append(value) if value <= min
    stack.append(value)
  end

  def pop
    value = stack.pop
    mins.pop if value == min

    value
  end

  def min
    return Float::INFINITY if mins.empty?

    mins.last
  end

  private

  attr_reader :stack, :mins
end

class TestStack < Minitest::Test
  def test_1
    stack = Stack.new

    assert_equal [5], stack.push(5)
    assert_equal 5, stack.min

    assert_equal [5, 6], stack.push(6)
    assert_equal 5, stack.min

    assert_equal [5, 6, 3], stack.push(3)
    assert_equal 3, stack.min

    assert_equal [5, 6, 3, 7], stack.push(7)
    assert_equal 3, stack.min

    assert_equal 7, stack.pop
    assert_equal 3, stack.min

    assert_equal 3, stack.pop
    assert_equal 5, stack.min
  end
end
