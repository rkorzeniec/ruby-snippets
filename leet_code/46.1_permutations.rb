# frozen_string_literal: true

# https://leetcode.com/problems/permutations/

require_relative '../test_helper'

# Runtime: 113 ms, faster than 66.00% of Ruby online submissions for Permutations.
# Memory Usage: 211 MB, less than 63.33% of Ruby online submissions for Permutations.
class Solution
  class << self
    def permute(nums)
      @permutations = []
      backtrack(nums:, combination: [])
      @permutations
    end

    def backtrack(nums:, combination:)
      return @permutations.append(combination.dup) if nums.empty?

      nums.size.times do |i|
        other_nums = nums[...i] + nums[(i + 1)..]

        combination.append(nums[i])
        backtrack(nums: other_nums, combination:)
        combination.pop
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [1, 2, 3]
    output = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

    assert_equal output, Solution.permute(nums)
  end

  def test_2
    nums = [0, 1]
    output = [[0, 1], [1, 0]]

    assert_equal output, Solution.permute(nums)
  end

  def test_3
    nums = [1]
    output = [[1]]

    assert_equal output, Solution.permute(nums)
  end
end
