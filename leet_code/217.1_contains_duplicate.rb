# frozen_string_literal: true

# https://leetcode.com/problems/contains-duplicate/

require_relative '../test_helper'
require 'set'

# Runtime: 180 ms, faster than 38.87% of Ruby online submissions for Contains Duplicate.
# Memory Usage: 218.8 MB, less than 53.80% of Ruby online submissions for Contains Duplicate.
class Solution
  class << self
    def contains_duplicate(nums)
      set = Set.new

      nums.each do |num|
        return true if set.include?(num)

        set.add(num)
      end

      false
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal true, Solution.contains_duplicate([1, 2, 3, 1])
  end

  def test_2
    assert_equal false, Solution.contains_duplicate([1, 2, 3, 4])
  end

  def test_3
    assert_equal true, Solution.contains_duplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2])
  end
end
