# frozen_string_literal: true

# https://leetcode.com/problems/climbing-stairs/

require_relative '../test_helper'

# Runtime: 102 ms, faster than 61.32% of Ruby online submissions for Min Cost Climbing Stairs.
# Memory Usage: 212.9 MB, less than 6.60% of Ruby online submissions for Min Cost Climbing Stairs.
class Solution
  class << self
    def min_cost_climbing_stairs(costs)
      [cost(costs, costs.size - 1), cost(costs, costs.size - 2)].min
    end

    def cost(costs, n, results: {})
      return 0 if n < 0
      return costs[n] if n <= 1
      return results[n] if results.key?(n)

      results[n] =
        costs[n] +
        [cost(costs, n - 1, results:), cost(costs, n - 2, results:)].min
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    cost = [10, 15, 20]
    output = 15

    assert_equal output, Solution.min_cost_climbing_stairs(cost)
  end

  def test_2
    cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
    output = 6

    assert_equal output, Solution.min_cost_climbing_stairs(cost)
  end
end
