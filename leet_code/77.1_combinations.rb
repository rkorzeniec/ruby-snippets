# frozen_string_literal: true

# https://leetcode.com/problems/combinations/

require_relative '../test_helper'

# Runtime: 445 ms, faster than 44.93% of Ruby online submissions for Combinations.
# Memory Usage: 214.1 MB, less than 43.48% of Ruby online submissions for Combinations.
class Solution
  class << self
    def combine(n, k)
      @result = []

      backtrack(n, k, [], 1)

      @result
    end

    def backtrack(num, remaining, combination, next_value)
      return @result.append(combination.dup) if remaining.zero?

      (next_value..num).each do |i|
        combination.append(i)
        backtrack(num, remaining - 1, combination, i + 1)
        combination.pop
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    n = 4
    k = 2
    output =
    [
      [1, 2],
      [1, 3],
      [1, 4],
      [2, 3],
      [2, 4],
      [3, 4],
    ]

    assert_equal output, Solution.combine(n, k)
  end

  def test_2
    n = 1
    k = 1
    output = [[1]]

    assert_equal output, Solution.combine(n, k)
  end
end
