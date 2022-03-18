# frozen_string_literal: true

# https://leetcode.com/problems/delete-and-earn/

require_relative '../test_helper'

# Runtime: 97 ms, faster than 79.27% of Ruby online submissions for Delete and Earn.
# Memory Usage: 214.5 MB, less than 12.20% of Ruby online submissions for Delete and Earn.
class Solution
  class << self
    def delete_and_earn(nums)
      @points = Hash.new(0)
      @cache = {}
      max_num = 0

      nums.each do |num|
        @points[num] += num
        max_num = [num, max_num].max
      end

      max_points(max_num)
    end

    def max_points(num)
      return num if num.zero?
      return @points[1] if num == 1
      return @cache[num] if @cache.key?(num)

      @cache[num] = [max_points(num - 1), max_points(num - 2) + @points[num]].max
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [3, 4, 2]
    output = 6

    assert_equal output, Solution.delete_and_earn(nums)
  end

  def test_2
    nums = [2, 2, 3, 3, 3, 4]
    output = 9

    assert_equal output, Solution.delete_and_earn(nums)
  end

  def test_3
    nums = [
      12, 32, 93, 17, 100, 72, 40, 71, 37, 92, 58, 34, 29, 78, 11, 84, 77, 90,
      92, 35, 12, 5, 27, 92, 91, 23, 65, 91, 85, 14, 42, 28, 80, 85, 38, 71, 62,
      82, 66, 3, 33, 33, 55, 60, 48, 78, 63, 11, 20, 51, 78, 42, 37, 21, 100, 13,
      60, 57, 91, 53, 49, 15, 45, 19, 51, 2, 96, 22, 32, 2, 46, 62, 58, 11, 29, 6,
      74, 38, 70, 97, 4, 22, 76, 19, 1, 90, 63, 55, 64, 44, 90, 51, 36, 16, 65,
      95, 64, 59, 53, 93
    ]
    output = 3451

    assert_equal output, Solution.delete_and_earn(nums)
  end
end
