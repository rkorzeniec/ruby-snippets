# frozen_string_literal: true

# https://leetcode.com/problems/permutations/

require_relative '../test_helper'


class Solution
  class << self
    def permute(nums)
      stack = [[nums, []]]
      permutations = []

      until stack.empty?
        nums, combination = stack.pop

        permutations.append(combination) if nums.empty?

        nums.size.times do |i|
          other_nums = nums[...i] + nums[(i + 1)..]
          stack.append([other_nums, combination + [nums[i]]])
        end
      end

      permutations
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [1, 2, 3]
    output = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]].reverse

    assert_equal output, Solution.permute(nums)
  end

  def test_2
    nums = [0, 1]
    output = [[0, 1], [1, 0]].reverse

    assert_equal output, Solution.permute(nums)
  end

  def test_3
    nums = [1]
    output = [[1]]

    assert_equal output, Solution.permute(nums)
  end
end
