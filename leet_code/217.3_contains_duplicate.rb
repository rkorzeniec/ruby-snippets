# frozen_string_literal: true

# https://leetcode.com/problems/contains-duplicate/

require_relative '../test_helper'

# Runtime: 104 ms, faster than 84.37% of Ruby online submissions for Contains Duplicate.
# Memory Usage: 218.9 MB, less than 44.37% of Ruby online submissions for Contains Duplicate.
class Solution
  class << self
    def contains_duplicate(nums)
      nums.size != nums.uniq.size
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
