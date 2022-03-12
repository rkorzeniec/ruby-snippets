# frozen_string_literal: true

# https://leetcode.com/problems/binary-search/

require 'minitest/autorun'

# Runtime: 105 ms, faster than 73.21% of Ruby online submissions for Binary Search.
# Memory Usage: 213.8 MB, less than 28.30% of Ruby online submissions for Binary Search.
class Solution
  class << self
    def search(nums, target)
      left = 0
      right = nums.size - 1

      while left <= right
        mid = (left + right) / 2

        if nums[mid] < target
          left = mid + 1
        elsif nums[mid] > target
          right = mid - 1
        else
          return mid
        end
      end

      -1
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [-1, 0, 3, 5, 9, 12]
    target = 9
    output = 4

    assert_equal output, Solution.search(nums, target)
  end

  def test_2
    nums = [-1, 0, 3, 5, 9, 12]
    target = 2
    output = -1

    assert_equal output, Solution.search(nums, target)
  end
end
