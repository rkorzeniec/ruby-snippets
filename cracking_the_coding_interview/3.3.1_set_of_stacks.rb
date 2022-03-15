# frozen_string_literal: true

# Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
# Therefore, in real life, we would likely start a new stack when the
# previous stack exceeds some threshold.

# Implement a data structure SetOfStacks that mimics this.
# SetOfStacks should be composed of several stacks and should create a new stack
# once the previous one exceeds capacity. SetOfStacks.push() and SetOfStacks.pop()
# should behave identically to a single stack (that is, pop() should return
# the same values as it would if there were just a single stack).

require_relative '../test_helper'

class SetOfStacks
  def initialize(capacity = 5)
    @stacks = [[]]
    @capacity = capacity
  end

  def push(value)
    if stacks.last.size == capacity
      stacks.append([value])
    else
      stacks.last.append(value)
    end
  end

  def pop
    value = stacks.last.pop

    stacks.pop if stacks.last.empty?

    value
  end

  private

  attr_reader :stacks, :capacity
end

class TestSetOfStacks < Minitest::Test
  def test_1
    stack = SetOfStacks.new

    assert_equal [[]], stack.send(:stacks)

    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    stack.push(5)

    assert_equal [[1, 2, 3, 4, 5], [6]], stack.push(6)

    stack.push(7)
    stack.push(8)
    stack.push(9)
    stack.push(10)

    assert_equal [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11]], stack.push(11)

    assert_equal 11, stack.pop
    assert_equal [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]], stack.send(:stacks)

    stack.pop
    stack.pop
    stack.pop
    stack.pop
    stack.pop

    assert_equal 5, stack.pop
    assert_equal [[1, 2, 3, 4]], stack.send(:stacks)
  end
end
