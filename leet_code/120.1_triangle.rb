# frozen_string_literal: true

# https://leetcode.com/pminimum_total(triangle)

require_relative '../test_helper'

# Runtime: 116 ms, faster than 56.25% of Ruby online submissions for Triangle.
# Memory Usage: 211.4 MB, less than 90.63% of Ruby online submissions for Triangle.
class Solution
  class << self
    def minimum_total(triangle)
      (1...triangle.size).each do |row|
        (row + 1).times do |i|
          i_or_row_end = [i, row - 1].min
          i_or_row_start = [i - 1, 0].max

          x = triangle[row - 1][i_or_row_end]
          y = triangle[row - 1][i_or_row_start]

          triangle[row][i] += [x, y].min
        end
      end

      triangle[-1].min
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    triangle = [[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]
    output = 11

    assert_equal output, Solution.minimum_total(triangle)
  end

  def test_2
    triangle = [[-10]]
    output = -10

    assert_equal output, Solution.minimum_total(triangle)
  end
end
