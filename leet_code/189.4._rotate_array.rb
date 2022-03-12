# frozen_string_literal: true

# https://leetcode.com/problems/rotate-array/

require 'minitest/autorun'

# Runtime: 175 ms, faster than 64.88% of Ruby online submissions for Rotate Array.
# Memory Usage: 218.4 MB, less than 76.14% of Ruby online submissions for Rotate Array.
class Solution
  class << self
    def rotate(nums, k)
      k %= nums.size
      k += nums.size if k < 0

      reverse(nums, 0, nums.size - k - 1)
      reverse(nums, nums.size - k, nums.size - 1)
      reverse(nums, 0, nums.size - 1)

      nums
    end

    def reverse(nums, left, right)
      while left < right
        temp = nums[left]
        nums[left] = nums[right]
        nums[right] = temp

        left += 1
        right -= 1
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [1, 2, 3, 4, 5, 6, 7]
    k = 3
    output = [5, 6, 7, 1, 2, 3, 4]

    assert_equal output, Solution.rotate(nums, k)
  end

  def test_2
    nums = [-1, -100, 3, 99]
    k = 2
    output = [3, 99, -1, -100]

    assert_equal output, Solution.rotate(nums, k)
  end
end
