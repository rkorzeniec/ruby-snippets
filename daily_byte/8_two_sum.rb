# frozen_string_literal: true

# This question is asked by Google.
# Given an array of integers, return whether or not two numbers sum to a given target, k.
# NOTE: you may not sum a number with itself.

require_relative '../test_helper'

class TwoSum
  def initialize(numbers)
    @numbers = numbers
  end

  def call(target)
    checked_nums = []

    numbers.each do |num|
      remaining_target = target - num

      return true if checked_nums.include?(remaining_target)

      checked_nums.append(num)
    end

    false
  end

  private

  attr_reader :numbers
end

class TestTwoSum < Minitest::Test
  def test_1
    assert_equal true, TwoSum.new([1, 3, 8, 2]).call(10)
  end

  def test_2
    assert_equal false, TwoSum.new([3, 9, 13, 7]).call(8)
  end

  def test_3
    assert_equal true, TwoSum.new([4, 2, 6, 5, 2]).call(4)
  end
end
