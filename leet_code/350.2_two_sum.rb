# frozen_string_literal: true

# https://leetcode.com/problems/intersection-of-two-arrays-ii/

# Follow up:

# What if the given array is already sorted? How would you optimize your algorithm?

require 'minitest/autorun'

# Runtime: 52 ms, faster than 98.65% of Ruby online submissions for Intersection of Two Arrays II.
# Memory Usage: 211.4 MB, less than 12.84% of Ruby online submissions for Intersection of Two Arrays II.
class Solution
  class << self
    def intersect(nums1, nums2)
      nums1.sort!
      nums2.sort!

      i = 0
      j = 0
      intersection = []

      while i < nums1.size && j < nums2.size
        if nums1[i] == nums2[j]
          intersection.append(nums1[i])
          i += 1
          j += 1
        else
          nums1[i] < nums2[j] ? i += 1 : j += 1
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
    assert_equal [4, 9], Solution.intersect([4, 9, 5], [9, 4, 9, 8, 4])
  end
end
