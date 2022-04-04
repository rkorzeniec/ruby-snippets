# frozen_string_literal: true

# https://leetcode.com/problems/combination-sum/

require_relative '../test_helper'

# Runtime: 156 ms, faster than 66.83% of Ruby online submissions for Combination Sum.
# Memory Usage: 211 MB, less than 71.29% of Ruby online submissions for Combination Sum.
class Solution
  class << self
    def combination_sum(candidates, target)
      @results = []
      backtrack(nums: candidates, combination: [], target:)
      @results
    end

    def backtrack(nums:, combination:, target:)
      return if target.negative?
      return @results.append(combination.dup) if target.zero?

      nums.size.times do |i|
        combination.append(nums[i])
        backtrack(nums: nums[i..], combination:, target: target - nums[i])
        combination.pop
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    candidates = [2, 3, 6, 7]
    target = 7
    output = [[2, 2, 3], [7]]

    assert_equal output, Solution.combination_sum(candidates, target)
  end

  def test_2
    candidates = [2, 3, 5]
    target = 8
    output = [[2, 2, 2, 2], [2, 3, 3], [3, 5]]

    assert_equal output, Solution.combination_sum(candidates, target)
  end

  def test_3
    candidates = [2]
    target = 1
    output = []

    assert_equal output, Solution.combination_sum(candidates, target)
  end
end
