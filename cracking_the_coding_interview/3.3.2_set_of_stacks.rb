# frozen_string_literal: true

# Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
# Therefore, in real life, we would likely start a new stack when the
# previous stack exceeds some threshold.

# Implement a data structure SetOfStacks that mimics this.
# SetOfStacks should be composed of several stacks and should create a new stack
# once the previous one exceeds capacity. SetOfStacks.push() and SetOfStacks.pop()
# should behave identically to a single stack (that is, pop() should return
# the same values as it would if there were just a single stack).

# FOLLOW UP
# Implement a function popAt(int index) which performs a pop operation on a specific sub-stack.

require 'minitest/autorun'

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

  def pop_at(index)
    stack_index = index / 5
    item_index = index % 5
    value = stacks[stack_index].delete_at(item_index)

    reorder_stacks(index)

    value
  end

  private

  attr_reader :stacks, :capacity

  def reorder_stacks(index)
    stack_index = index / 5

    (stack_index...stacks.size).each do |i|
      break if i + 1 >= stacks.size

      item = stacks[i + 1].delete_at(0)
      stacks[i].append(item)
    end

    stacks.pop if stacks.last.empty?
  end
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

    stack.push(5)
    stack.push(6)
    stack.push(7)
    stack.push(8)
    assert_equal [[1, 2, 3, 4, 5], [6, 7, 8]], stack.send(:stacks)

    assert_equal 1, stack.pop_at(0)
    assert_equal [[2, 3, 4, 5, 6], [7, 8]], stack.send(:stacks)

    assert_equal 7, stack.pop_at(5)
    assert_equal [[2, 3, 4, 5, 6], [8]], stack.send(:stacks)

    assert_equal 2, stack.pop_at(0)
    assert_equal [[3, 4, 5, 6, 8]], stack.send(:stacks)
  end
end
