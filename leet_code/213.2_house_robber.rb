# frozen_string_literal: true

# https://leetcode.com/problems/delete-and-earn/

require_relative '../test_helper'

# Runtime: 84 ms, faster than 72.73% of Ruby online submissions for House Robber II.
# Memory Usage: 211.1 MB, less than 12.73% of Ruby online submissions for House Robber II.
class Solution
  class << self
    def rob(nums)
      length = nums.size - 1

      return nums[0] if length.zero?

      [
        plan_robbery(nums[0...length]),
        plan_robbery(nums[1..length])
      ].max
    end

    def plan_robbery(nums)
      nums = [0, 0, 0] + nums

      (3...nums.size).each do |i|
        nums[i] = [nums[i - 3] + nums[i], nums[i - 2] + nums[i]].max
      end

      nums.max
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [2, 3, 2]
    output = 3

    assert_equal output, Solution.rob(nums)
  end

  def test_2
    nums = [1, 2, 3, 1]
    output = 4

    assert_equal output, Solution.rob(nums)
  end

  def test_3
    nums = [1, 2, 3]
    output = 3

    assert_equal output, Solution.rob(nums)
  end

  def test_4
    nums = [1]
    output = 1

    assert_equal output, Solution.rob(nums)
  end
end
