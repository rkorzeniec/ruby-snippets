# frozen_string_literal: true

# Write a program to sort a stack such that the smallest items are on the top.
# You can use an additional temporary stack, but you may not copy the elements
# into any other data structure (such as an array).

# The stack supports the following operations: push, pop, peek, and isEmpty.

require 'minitest/autorun'

class Stack
  def initialize
    @stack = []
  end

  def push(value)
    stack.append(value)
  end

  def pop
    stack.pop
  end

  def empty?
    stack.empty?
  end

  def peek
    stack.last
  end

  def sort
    sorted_stack = []

    until stack.empty?
      temp = stack.pop

      while sorted_stack.last && sorted_stack.last < temp
        item = sorted_stack.pop
        stack.push(item)
      end

      sorted_stack.push(temp)
    end

    @stack = sorted_stack
  end

  private

  attr_reader :stack
end

class TestStack < Minitest::Test
  def test_1
    stack = Stack.new

    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    stack.push(5)

    assert_equal [1, 2, 3, 4, 5], stack.send(:stack)
    assert_equal [5, 4, 3, 2, 1], stack.sort
  end

  def test_2
    stack = Stack.new

    stack.push(1)
    stack.push(4)
    stack.push(3)
    stack.push(2)
    stack.push(5)

    assert_equal [1, 4, 3, 2, 5], stack.send(:stack)
    assert_equal [5, 4, 3, 2, 1], stack.sort
  end
end
