# frozen_string_literal: true

# https://leetcode.com/problems/largest-perimeter-triangle/

require 'minitest/autorun'

# Runtime: 168 ms, faster than 27.27% of Ruby online submissions for Largest Perimeter Triangle.
# Memory Usage: 213.5 MB, less than 72.73% of Ruby online submissions for Largest Perimeter Triangle.
class Solution
  class << self
    def largest_perimeter(nums)
      return 0 if nums.size < 3

      nums.sort! { |a, b| b <=> a }

      (2...nums.size).each do |i|
        return nums[i - 2] + nums[i - 1] + nums[i] if nums[i - 2] < (nums[i - 1] + nums[i])
      end

      0
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [2, 1, 2]
    output = 5

    assert_equal output, Solution.largest_perimeter(nums)
  end

  def test_2
    nums = [1, 2, 1]
    output = 0

    assert_equal output, Solution.largest_perimeter(nums)
  end
end
