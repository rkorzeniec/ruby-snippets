# frozen_string_literal: true

# https://leetcode.com/problems/merge-intervals/

require_relative '../test_helper'

# Runtime: 100 ms, faster than 98.44% of Ruby online submissions for Merge Intervals.
# Memory Usage: 212.8 MB, less than 32.50% of Ruby online submissions for Merge Intervals.
class Solution
  class << self
    def merge(intervals)
      intervals.sort_by! { |interval| interval[0] }

      result = [intervals[0]]

      (1...intervals.size).each do |i|
        if intervals[i][0] <= result[-1][1]
          result[-1][1] = [result[-1][1], intervals[i][1]].max
        else
          result.append(intervals[i])
        end
      end

      result
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
    output = [[1, 6], [8, 10], [15, 18]]

    assert_equal output, Solution.merge(intervals)
  end

  def test_2
    intervals = [[1, 4], [4, 5]]
    output = [[1, 5]]

    assert_equal output, Solution.merge(intervals)
  end

  def test_3
    intervals = [[1, 4], [0, 4]]
    output = [[0, 4]]

    assert_equal output, Solution.merge(intervals)
  end

  def test_4
    intervals = [[1, 4], [0, 0]]
    output = [[0, 0], [1, 4]]

    assert_equal output, Solution.merge(intervals)
  end
end
