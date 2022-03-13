# frozen_string_literal: true

# https://leetcode.com/problems/n-th-tribonacci-number/

require 'minitest/autorun'

# Runtime: 64 ms, faster than 85.57% of Ruby online submissions for N-th Tribonacci Number.
# Memory Usage: 210.9 MB, less than 54.64% of Ruby online submissions for N-th Tribonacci Number.
class Solution
  class << self
    def tribonacci(n, cache: {})
      return 0 if n <= 0
      return 1 if n <= 2
      return cache[n] if cache.key?(n)

      cache[n] =
        tribonacci(n - 1, cache:) +
        tribonacci(n - 2, cache:) +
        tribonacci(n - 3, cache:)

      cache[n]
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    n = 25
    output = 1_389_537

    assert_equal output, Solution.tribonacci(n)
  end

  def test_2
    n = 4
    output = 4

    assert_equal output, Solution.tribonacci(n)
  end
end
