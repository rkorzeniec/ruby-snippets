# frozen_string_literal: true

# https://leetcode.com/pminimum_total(triangle)

require_relative '../test_helper'

# Runtime: 80 ms, faster than 93.75% of Ruby online submissions for Triangle.
# Memory Usage: 212.8 MB, less than 28.13% of Ruby online submissions for Triangle.
class Solution
  class << self
    def minimum_total(triangle, row: 0, col: 0, cache: {})
      return cache[row][col] if cache.key?(row) && cache[row].key?(col)
      return 0 if row >= triangle.size
      return 0 if col >= triangle[row].size

      next_min = [
        minimum_total(triangle, row: row + 1, col:, cache:),
        minimum_total(triangle, row: row + 1, col: col + 1, cache:)
      ].min

      cache[row] = {} unless cache.key?(row)

      cache[row][col] = triangle[row][col] + next_min
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
