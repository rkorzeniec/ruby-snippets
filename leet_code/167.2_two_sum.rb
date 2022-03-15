# frozen_string_literal: true

# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

require_relative '../test_helper'

# Runtime: 56 ms, faster than 95.90% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
# Memory Usage: 212.2 MB, less than 11.19% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
class Solution
  class << self
    def two_sum(numbers, target)
      left = 0
      right = numbers.size - 1

      while left < right
        result = numbers[left] + numbers[right]

        return [left + 1, right + 1] if result == target

        result < target ? left += 1 : right -= 1
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    numbers = [2, 7, 11, 15]
    target = 9
    output = [1, 2]

    assert_equal output, Solution.two_sum(numbers, target)
  end

  def test_2
    numbers = [2, 3, 4]
    target = 6
    output = [1, 3]

    assert_equal output, Solution.two_sum(numbers, target)
  end

  def test_3
    numbers = [-1, 0]
    target = -1
    output = [1, 2]

    assert_equal output, Solution.two_sum(numbers, target)
  end
end
