# frozen_string_literal: true

# https://leetcode.com/problems/two-sum/

require 'minitest/autorun'

# Runtime: 72 ms, faster than 87.22% of Ruby online submissions for Two Sum.
# Memory Usage: 212.2 MB, less than 22.15% of Ruby online submissions for Two Sum.
class Solution
  class << self
    def two_sum(nums, target)
      cache = {}

      (0...nums.size).each do |index|
        remaining = target - nums[index]

        return [cache[remaining], index] if cache[remaining]

        cache[nums[index]] = index
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal [0, 1], Solution.two_sum([2, 7, 11, 15], 9)
  end

  def test_2
    assert_equal [1, 2], Solution.two_sum([3, 2, 4], 6)
  end

  def test_3
    assert_equal [0, 1], Solution.two_sum([3, 3], 6)
  end
end
