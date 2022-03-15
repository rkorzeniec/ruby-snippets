# frozen_string_literal: true

# https://leetcode.com/problems/climbing-stairs/

require_relative '../test_helper'

# Runtime: 64 ms, faster than 87.84% of Ruby online submissions for Climbing Stairs.
# Memory Usage: 210.9 MB, less than 51.35% of Ruby online submissions for Climbing Stairs.
class Solution
  class << self
    def climb_stairs(n, cache: {})
      return n if n <= 2
      return cache[n] if cache.key?(n)

      cache[n] = climb_stairs(n - 1, cache:) + climb_stairs(n - 2, cache:)
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    n = 2
    output = 2

    assert_equal output, Solution.climb_stairs(n)
  end

  def test_2
    n = 3
    output = 3

    assert_equal output, Solution.climb_stairs(n)
  end
end
