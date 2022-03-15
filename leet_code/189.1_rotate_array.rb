# frozen_string_literal: true

# https://leetcode.com/problems/rotate-array/

require_relative '../test_helper'

# Runtime: 159 ms, faster than 73.19% of Ruby online submissions for Rotate Array.
# Memory Usage: 219 MB, less than 20.38% of Ruby online submissions for Rotate Array.
class Solution
  class << self
    def rotate(nums, k)
      k = k % nums.size

      k.times do |_|
        temp = nums.pop
        nums.prepend(temp)
      end

      nums
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
