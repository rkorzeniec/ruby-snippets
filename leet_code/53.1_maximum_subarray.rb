# frozen_string_literal: true

# https://leetcode.com/problems/maximum-subarray/

require 'minitest/autorun'

# Runtime: 209 ms, faster than 58.00% of Ruby online submissions for Maximum Subarray.
# Memory Usage: 220.4 MB, less than 15.60% of Ruby online submissions for Maximum Subarray.
class Solution
  class << self
    def max_sub_array(nums)
      max_sum = nums[0]
      current_sum = max_sum

      nums[1..].each do |num|
        current_sum = current_sum > 0 ? current_sum + num : num

        max_sum = current_sum if current_sum > max_sum
      end

      max_sum
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal 6, Solution.max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4])
  end

  def test_2
    assert_equal 1, Solution.max_sub_array([1])
  end

  def test_3
    assert_equal 23, Solution.max_sub_array([5, 4, -1, 7, 8])
  end
end
