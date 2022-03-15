# frozen_string_literal: true

# https://leetcode.com/problems/fibonacci-number/

require_relative '../test_helper'

# Runtime: 101 ms, faster than 73.04% of Ruby online submissions for Fibonacci Number.
# Memory Usage: 211.1 MB, less than 33.04% of Ruby online submissions for Fibonacci Number.
class Solution
  class << self
    def fib(n, cache: {})
      return 0 if n == 0
      return 1 if n == 1
      return cache[n] if cache.key?(n)

      cache[n] = fib(n - 1, cache:) + fib(n - 2, cache:)
      cache[n]
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    n = 2
    output = 1

    assert_equal output, Solution.fib(n)
  end

  def test_2
    n = 3
    output = 2

    assert_equal output, Solution.fib(n)
  end

  def test_3
    n = 4
    output = 3

    assert_equal output, Solution.fib(n)
  end
end
