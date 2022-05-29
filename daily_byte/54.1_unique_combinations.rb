# frozen_string_literal: true

# This question is asked by Apple.

# Given a list of positive numbers without duplicates and a target number,
# find all unique combinations of the numbers that sum to the target.

# NOTE: You may use the same number more than once.

# Ex: Given the following numbers and target…
# numbers = [2,4,6,3], target = 6,

# return [
#     [2,2,2],
#     [2,4],
#     [3,3],
#     [6]
# ]

require_relative '../test_helper'

class Solution
  def unique_combinations(nums, target)
    @result = []

    backtrack(nums, target:)
    @result
  end

  def backtrack(nums, target:, combination: [])
    return @result.append(combination.dup) if target.zero?
    return if target.negative?

    nums.size.times do |i|
      combination.append(nums[i])
      backtrack(nums[i..], combination:, target: target - nums[i])
      combination.pop
    end
  end
end

class Test < Minitest::Test
  def test_1
    nums = [2, 4, 6, 3]
    target = 6
    output = [[2, 2, 2], [2, 4], [6], [3, 3]]

    assert_equal output, Solution.new.unique_combinations(nums, target)
  end
end
