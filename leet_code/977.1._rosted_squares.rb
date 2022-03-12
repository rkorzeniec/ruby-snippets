# frozen_string_literal: true

# https://leetcode.com/problems/rotate-array/

require 'minitest/autorun'

# Runtime: 165 ms, faster than 74.08% of Ruby online submissions for Squares of a Sorted Array.
# Memory Usage: 213.5 MB, less than 67.89% of Ruby online submissions for Squares of a Sorted Array.
class Solution
  class << self
    def sorted_squares(nums)
      result = [0] * nums.size

      left = 0
      right = nums.size - 1

      while left <= right
        left_num = nums[left].abs
        right_num = nums[right].abs

        if left_num > right_num
          result[right - left] = left_num**2
          left += 1
        else
          result[right - left] = right_num**2
          right -= 1
        end
      end

      result
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [-4, -1, 0, 3, 10]
    output = [0, 1, 9, 16, 100]

    assert_equal output, Solution.sorted_squares(nums)
  end

  def test_2
    nums = [-7, -3, 2, 3, 11]
    output = [4, 9, 9, 49, 121]

    assert_equal output, Solution.sorted_squares(nums)
  end
end
