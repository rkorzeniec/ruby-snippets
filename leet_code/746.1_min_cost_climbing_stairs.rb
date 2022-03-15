# frozen_string_literal: true

# https://leetcode.com/problems/min-cost-climbing-stairs/

require_relative '../test_helper'

# Runtime: 92 ms, faster than 69.81% of Ruby online submissions for Min Cost Climbing Stairs.
# Memory Usage: 212.9 MB, less than 6.60% of Ruby online submissions for Min Cost Climbing Stairs.
class Solution
  class << self
    def min_cost_climbing_stairs(costs)
      [cost(costs, i: 0), cost(costs, i: 1)].min
    end

    def cost(costs, i:, results: {})
      return 0 unless i < costs.size
      return results[i] if results.key?(i)

      min = [cost(costs, i: i + 1, results:), cost(costs, i: i + 2, results:)].min

      results[i] = costs[i] + min
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
