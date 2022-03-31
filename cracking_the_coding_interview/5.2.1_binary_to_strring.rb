# frozen_string_literal: true

# Given a real number between O and 1 (e.g., 0.72) that is passed in as a double,
# print the binary representation.
# If the number cannot be represented accurately in binary with at most 32 characters,
# print "ERROR:'

require_relative '../test_helper'

class Solution
  def insertion(num)
    return 'ERROR' if num >= 1 || num <= 0

    binary = ['.']

    while num > 0
      return 'ERROR' if binary.size >= 32

      r = num * 2
      if r >= 1
        binary.append(1)
        num = r - 1
      else
        binary.append(0)
        num = r
      end

      binary.join
    end
  end
end

class Test < Minitest::Test
  def test_1
    assert_equal 0b10001001100, Solution.new.insertion(0.2)
  end
end
