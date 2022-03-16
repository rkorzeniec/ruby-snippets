# frozen_string_literal: true

# https://leetcode.com/problems/delete-and-earn/

require_relative '../test_helper'

# Runtime: 60 ms, faster than 91.47% of Ruby online submissions for House Robber.
# Memory Usage: 210.9 MB, less than 76.30% of Ruby online submissions for House Robber.
class Solution
  class << self
    def rob(nums)
      [
        plan_robbery(nums, i: nums.size - 1),
        plan_robbery(nums, i: nums.size - 2)
      ].max
    end

    def plan_robbery(nums, i:, cache: {})
      return 0 if i < 0
      return cache[i] if cache.key?(i)

      cache[i] =
        nums[i] +
        [plan_robbery(nums, i: i - 2, cache:), plan_robbery(nums, i: i - 3, cache:)].max
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [1, 2, 3, 1]
    output = 4

    assert_equal output, Solution.rob(nums)
  end

  def test_2
    nums = [2, 7, 9, 3, 1]
    output = 12

    assert_equal output, Solution.rob(nums)
  end

  def test_3
    nums = [2, 1, 1, 2]
    output = 4

    assert_equal output, Solution.rob(nums)
  end
end
