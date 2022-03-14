# frozen_string_literal: true

# https://leetcode.com/problems/number-of-1-bits/

require 'minitest/autorun'


class Solution
  class << self
    def hamming_weight(n)
      count = 0

      while n > 0
        n &= (n - 1)
        count += 1
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
