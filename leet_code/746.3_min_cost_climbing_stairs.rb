# frozen_string_literal: true

# https://leetcode.com/problems/min-cost-climbing-stairs/

require 'minitest/autorun'

# Runtime: 80 ms, faster than 79.25% of Ruby online submissions for Min Cost Climbing Stairs.
# Memory Usage: 211.4 MB, less than 44.34% of Ruby online submissions for Min Cost Climbing Stairs.
class Solution
  class << self
    def min_cost_climbing_stairs(costs)
      n = costs.length
      first = costs[0]
      second = costs[1]

      return [first, second].min if n <= 2

      (2...n).each do |i|
        current = costs[i] + [first, second].min

        first = second
        second = current
      end

      [first, second].min
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
