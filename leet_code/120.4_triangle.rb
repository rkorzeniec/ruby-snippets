# frozen_string_literal: true

# https://leetcode.com/pminimum_total(triangle)

require_relative '../test_helper'

# Runtime: 96 ms, faster than 81.25% of Ruby online submissions for Triangle.
# Memory Usage: 211.7 MB, less than 43.75% of Ruby online submissions for Triangle.
class Solution
  class << self
    def minimum_total(triangle)
      nums = triangle.size
      cur_row =  [0] * nums
      next_row = triangle[nums - 1]

      (triangle.size - 2).downto(0) do |row|
        (row + 1).times do |i|
          cur_row[i] = triangle[row][i] + [next_row[i], next_row[i + 1]].min
        end

        cur_row, next_row = next_row, cur_row
      end

      next_row[0]
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
