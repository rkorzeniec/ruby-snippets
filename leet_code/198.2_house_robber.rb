# frozen_string_literal: true

# https://leetcode.com/problems/delete-and-earn/

require_relative '../test_helper'

# Runtime: 56 ms, faster than 94.79% of Ruby online submissions for House Robber.
# Memory Usage: 211.1 MB, less than 36.97% of Ruby online submissions for House Robber.
class Solution
  class << self
    def rob(nums)
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
