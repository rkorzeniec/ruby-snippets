# frozen_string_literal: true

# https://leetcode.com/problems/permutations/

require_relative '../test_helper'


class Solution
  class << self
    def permute(nums)
      @permutations = []
      backtrack(nums:, combination: [])
      @permutations
    end

    def backtrack(nums:, combination:)
      return @permutations.append(combination) if nums.empty?

      nums.size.times do |i|
        other_nums = nums[...i] + nums[(i + 1)..]
        new_combination = combination + [nums[i]]
        backtrack(nums: other_nums, combination: new_combination)
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
