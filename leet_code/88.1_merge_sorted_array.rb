# frozen_string_literal: true

# https://leetcode.com/problems/merge-sorted-array/

require_relative '../test_helper'

# Runtime: 109 ms, faster than 51.85% of Ruby online submissions for Merge Sorted Array.
# Memory Usage: 210.9 MB, less than 60.37% of Ruby online submissions for Merge Sorted Array.
class Solution
  class << self
    def merge(nums1, m, nums2, n)
      k = m + n - 1
      m -= 1
      n -= 1

      while m >= 0 && n >= 0
        if nums2[n] >= nums1[m]
          nums1[k] = nums2[n]
          k -= 1
          n -= 1
        else
          nums1[k] = nums1[m]
          k -= 1
          m -= 1
        end
      end

      while n >= 0
        nums1[k] = nums2[n]
        k -= 1
        n -= 1
      end

      nil
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    nums1 = [1, 2, 3, 0, 0, 0]
    assert_nil Solution.merge(nums1, 3, [2, 5, 6], 3)
    assert_equal [1, 2, 2, 3, 5, 6], nums1
  end

  def test_2
    nums1 = [1]
    assert_nil Solution.merge(nums1, 1, [], 0)
    assert_equal [1], nums1
  end

  def test_3
    nums1 = [0]
    assert_nil Solution.merge(nums1, 0, [1], 1)
    assert_equal [1], nums1
  end

  def test_4
    nums1 = [4, 5, 6, 0, 0, 0]
    assert_nil Solution.merge(nums1, 3, [1, 2, 3], 3)
    assert_equal [1, 2, 3, 4, 5, 6], nums1
  end

  def test_5
    nums1 = [1, 2, 4, 5, 6, 0]
    assert_nil Solution.merge(nums1, 5, [3], 1)
    assert_equal [1, 2, 3, 4, 5, 6], nums1
  end
end
