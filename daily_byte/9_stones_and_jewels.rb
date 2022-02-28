# frozen_string_literal: true

# This question is asked by Amazon.
# Given a string representing your stones and another string representing a list of jewels,
# return the number of stones that you have that are also jewels.

require 'minitest/autorun'

class StonesAndJewels
  def initialize(stones:, jewels:)
    @stones = stones
    @jewels = jewels
  end

  def count
    count = 0

    stones.chars.each { |stone| count += jewels.count(stone) }

    count
  end

  private

  attr_reader :stones, :jewels
end

class TestStonesAndJewels < Minitest::Test
  def test_1
    assert_equal 2, StonesAndJewels.new(stones: 'abc', jewels: 'ac').count
  end

  def test_2
    assert_equal 3, StonesAndJewels.new(stones: 'Af', jewels: 'AaaddfFf').count
  end

  def test_3
    assert_equal 0, StonesAndJewels.new(stones: 'AYOPD', jewels: 'ayopd').count
  end
end
