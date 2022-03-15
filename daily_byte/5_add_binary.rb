# frozen_string_literal: true

# This question is asked by Apple.
# Given two binary strings (strings containing only 1s and 0s)
# return their sum (also as a binary string).

# NOTE: neither binary string will contain leading 0s unless the string itself is 0

require_relative '../test_helper'

class Binary
  def initialize(binary)
    @binary = binary
  end

  def add(other_binary)
    max_length = max_length(binary, other_binary)

    binary_term = pad_binary(binary, max_length)
    other_binary_term = pad_binary(other_binary, max_length)

    carry = 0
    result = ''

    (max_length - 1).downto(0) do |i|
      sum = carry + binary_term[i].to_i + other_binary_term[i].to_i

      result = "#{sum.odd? ? '1' : '0'}#{result}"
      carry = sum < 2 ? 0 : 1
    end

    carry.zero? ? result : "1#{result}"
  end

  private

  attr_reader :binary

  def max_length(binary, other_binary)
    [binary.length, other_binary.length].max
  end

  def pad_binary(binary, max_length)
    binary.rjust(max_length, '0')
  end
end

class TestBinary < Minitest::Test
  def test_1
    assert_equal '101', Binary.new('100').add('1')
  end

  def test_2
    assert_equal '100', Binary.new('11').add('1')
  end

  def test_3
    assert_equal '1', Binary.new('1').add('0')
  end

  def test_4
    assert_equal '10001', Binary.new('1101').add('100')
  end
end
