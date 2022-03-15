# frozen_string_literal: true

# https://leetcode.com/problems/intersection-of-two-arrays-ii/

require_relative '../test_helper'

# Runtime: 52 ms, faster than 98.65% of Ruby online submissions for Intersection of Two Arrays II.
# Memory Usage: 211.4 MB, less than 12.84% of Ruby online submissions for Intersection of Two Arrays II.
class Solution
  class << self
    def intersect(nums1, nums2)
      counter = Hash.new(0)
      intersection = []

      nums1.each { |num| counter[num] += 1 }

      nums2.each do |num|
        if counter[num] && counter[num] > 0
          intersection.append(num)
          counter[num] -= 1
        end
      end

      intersection
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal [2, 2], Solution.intersect([1, 2, 2, 1], [2, 2])
  end

  def test_2
    assert_equal [9, 4], Solution.intersect([4, 9, 5], [9, 4, 9, 8, 4])
  end
end
