# frozen_string_literal: true

# https://leetcode.com/problems/search-in-rotated-sorted-array/

require_relative '../test_helper'

# Runtime: 98 ms, faster than 67.12% of Ruby online submissions for Search in Rotated Sorted Array.
# Memory Usage: 211.1 MB, less than 52.70% of Ruby online submissions for Search in Rotated Sorted Array.
class Solution
  class << self
    def search(nums, target)
      left = 0
      right = nums.size - 1

      while left <= right
        mid = (left + right) / 2
        return mid if nums[mid] == target

        if nums[left] <= nums[mid]
          if target < nums[mid] && target >= nums[left]
            right = mid - 1
          else
            left = mid + 1
          end
        end

        if nums[mid] <= nums[right]
          if target > nums[mid] && target <= nums[right]
            left = mid + 1
          else
            right = mid - 1
          end
        end
      end

      -1
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [4, 5, 6, 7, 0, 1, 2]
    target = 0
    output = 4

    assert_equal output, Solution.search(nums, target)
  end

  def test_2
    nums = [4, 5, 6, 7, 0, 1, 2]
    target = 3
    output = -1

    assert_equal output, Solution.search(nums, target)
  end

  def test_3
    nums = [1]
    target = 0
    output = -1

    assert_equal output, Solution.search(nums, target)
  end
end
