# frozen_string_literal: true

# https://leetcode.com/problems/search-insert-position/

require 'minitest/autorun'

# Runtime: 99 ms, faster than 60.52% of Ruby online submissions for Search Insert Position.
# Memory Usage: 211.1 MB, less than 60.30% of Ruby online submissions for Search Insert Position.
class Solution
  class << self
    def search_insert(nums, target)
      left = 0
      right = nums.size - 1

      return left if target <= nums[left]
      return right + 1 if target > nums[right]

      while left <= right
        pivot = (left + right) / 2

        if nums[pivot] < target
          left = pivot + 1
        elsif nums[pivot] > target
          right = pivot - 1
        else
          return pivot
        end
      end

      left
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [1, 3, 5, 6]
    target = 5
    output = 2

    assert_equal output, Solution.search_insert(nums, target)
  end

  def test_2
    nums = [1, 3, 5, 6]
    target = 2
    output = 1

    assert_equal output, Solution.search_insert(nums, target)
  end

  def test_3
    nums = [1, 3, 5, 6]
    target = 7
    output = 4

    assert_equal output, Solution.search_insert(nums, target)
  end

  def test_4
    nums = [1, 3]
    target = 2
    output = 1

    assert_equal output, Solution.search_insert(nums, target)
  end
end
