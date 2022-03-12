# frozen_string_literal: true

# https://leetcode.com/problems/move-zeroes/

require 'minitest/autorun'

# Runtime: 130 ms, faster than 78.37% of Ruby online submissions for Move Zeroes.
# Memory Usage: 213.2 MB, less than 5.09% of Ruby online submissions for Move Zeroes.
class Solution
  class << self
    def move_zeroes(nums)
      zero = 0

      nums.size.times do |i|
        next if nums[i] == 0

        nums[zero], nums[i] = nums[i], nums[zero]
        zero += 1
      end

      nums
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [0, 1, 0, 3, 12]
    output = [1, 3, 12, 0, 0]

    assert_equal output, Solution.move_zeroes(nums)
  end

  def test_2
    nums = [0]
    output = [0]

    assert_equal output, Solution.move_zeroes(nums)
  end

  def test_3
    nums = [0, 0]
    output = [0, 0]

    assert_equal output, Solution.move_zeroes(nums)
  end

  def test_4
    nums = [2, 1]
    output = [2, 1]

    assert_equal output, Solution.move_zeroes(nums)
  end

  def test_5
    nums = [4, 2, 4, 0, 0, 3, 0, 5, 1, 0]
    output = [4, 2, 4, 3, 5, 1, 0, 0, 0, 0]

    assert_equal output, Solution.move_zeroes(nums)
  end
end
