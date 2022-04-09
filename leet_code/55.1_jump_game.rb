# frozen_string_literal: true

# https://leetcode.com/problems/jump-game/

require_relative '../test_helper'

# Runtime: 166 ms, faster than 70.79% of Ruby online submissions for Jump Game.
# Memory Usage: 215.9 MB, less than 96.63% of Ruby online submissions for Jump Game.
class Solution
  class << self
    def can_jump(nums)
      return true if nums.size <= 1

      max_i = 0

      nums.each_with_index do |num, i|
        return false if i > max_i

        max_i = [max_i, i + num].max
      end

      true
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums = [2, 3, 1, 1, 4]
    output = true

    assert_equal output, Solution.can_jump(nums)
  end

  def test_2
    nums = [3, 2, 1, 0, 4]
    output = false

    assert_equal output, Solution.can_jump(nums)
  end

  def test_3
    nums = [0]
    output = true

    assert_equal output, Solution.can_jump(nums)
  end

  def test_4
    nums = [2, 0]
    output = true

    assert_equal output, Solution.can_jump(nums)
  end
end
