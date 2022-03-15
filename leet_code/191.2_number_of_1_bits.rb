# frozen_string_literal: true

# https://leetcode.com/problems/number-of-1-bits/

require_relative '../test_helper'

# Runtime: 107 ms, faster than 49.59% of Ruby online submissions for Number of 1 Bits.
# Memory Usage: 210.9 MB, less than 17.07% of Ruby online submissions for Number of 1 Bits.
class Solution
  class << self
    def hamming_weight(n)
      count = 0

      while n > 0
        count += n & 1
        n >>= 1
      end

      count
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    n = 00000000000000000000000000001011
    output = 3

    assert_equal output, Solution.hamming_weight(n)
  end

  def test_2
    n = 00000000000000000000000010000000
    output = 1

    assert_equal output, Solution.hamming_weight(n)
  end

  def test_3
    n = 11111111111111111111111111111101
    output = 31

    assert_equal output, Solution.hamming_weight(n)
  end
end
