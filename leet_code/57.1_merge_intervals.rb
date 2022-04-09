# frozen_string_literal: true

# https://leetcode.com/problems/insert-interval/

require_relative '../test_helper'

# Runtime: 80 ms, faster than 90.20% of Ruby online submissions for Insert Interval.
# Memory Usage: 211.5 MB, less than 74.51% of Ruby online submissions for Insert Interval.
class Solution
  class << self
    def insert(intervals, new_interval)
      left = []
      right = []

      intervals.each do |interval|
        if interval[1] < new_interval[0]
          left.append(interval)
        elsif interval[0] > new_interval[1]
          right.append(interval)
        else
          new_interval[0] = [new_interval[0], interval[0]].min
          new_interval[1] = [new_interval[1], interval[1]].max
        end
      end

      left + [new_interval] + right
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    intervals = [[1, 3], [6, 9]]
    new_interval = [2, 5]
    output = [[1, 5], [6, 9]]

    assert_equal output, Solution.insert(intervals, new_interval)
  end

  def test_2
    intervals = [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]]
    new_interval = [4, 8]
    output = [[1, 2], [3, 10], [12, 16]]

    assert_equal output, Solution.insert(intervals, new_interval)
  end
end
