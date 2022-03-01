# frozen_string_literal: true

# This question is asked by Google.
# Given two integer arrays, return their intersection.
# NOTE: the intersection is the set of elements that are common to both arrays.

require 'minitest/autorun'
require 'set'

class ArrayIntersection
  def initialize(numbers)
    @numbers = numbers
  end

  def find(other_numbers)
    intersection = Set.new

    numbers.each do |number|
      intersection.add(number) if other_numbers.include?(number)
    end

    intersection.to_a
  end

  private

  attr_reader :numbers
end

class TestArrayIntersection < Minitest::Test
  def test_1
    assert_equal [2, 4], ArrayIntersection.new([2, 4, 4, 2]).find([2, 4])
  end

  def test_2
    assert_equal [3], ArrayIntersection.new([1, 2, 3, 3]).find([3, 3])
  end

  def test_3
    assert_equal [], ArrayIntersection.new([2, 4, 6, 8]).find([1, 3, 5, 7])
  end
end
