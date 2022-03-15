# frozen_string_literal: true

# This question is asked by Microsoft.

# Design a class, MovingAverage, which contains a method,
# next that is responsible for returning the moving average from a stream of integers.

# NOTE: a moving average is the average of a subset of data at a given point in time.

# Ex: Given the following series of events...

# // i.e. the moving average has a capacity of 3.
# MovingAverage movingAverage = new MovingAverage(3)
# m.next(3) returns 3 because(3 / 1) = 3
# m.next(5) returns 4 because(3 + 5) / 2 = 4
# m.next(7) = returns 5 because(3 + 5 + 7) / 3 = 5
# m.next(6) = returns 6 because(5 + 7 + 6) / 3 = 6

require_relative '../test_helper'

class MovingAverage
  def initialize(capacity)
    @capacity = capacity
    @numbers = []
  end

  def next(value)
    numbers.append(value)

    dequeue_numbers
    calculate_average
  end

  private

  attr_reader :capacity, :numbers

  def dequeue_numbers
    return unless numbers.size > capacity

    # @numbers = numbers[1..] could also be used
    numbers.shift
  end

  def calculate_average
    # numbers.sum could be also replaced by sum = 0; numbers.each { |n| sum += n}
    numbers.sum / numbers.size
  end
end

class TestMovingAverage < Minitest::Test
  def test_1
    average = MovingAverage.new(3)

    assert_equal 3, average.next(3)
    assert_equal 4, average.next(5)
    assert_equal 5, average.next(7)
    assert_equal 6, average.next(8)
  end
end
