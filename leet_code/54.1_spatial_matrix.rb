# frozen_string_literal: true

# https://leetcode.com/problems/spiral-matrix/

require_relative '../test_helper'

# Runtime: 94 ms, faster than 63.44% of Ruby online submissions for Spiral Matrix.
# Memory Usage: 211.1 MB, less than 49.46% of Ruby online submissions for Spiral Matrix.
class Solution
  class << self
    def spiral_order(matrix)
      result = []

      return result if matrix.nil? || matrix[0].nil?

      top = 0
      left = 0
      bottom = matrix.size - 1
      right = matrix[0].size - 1

      while top <= bottom || left <= right
        (left..right).each { |i| result.append(matrix[top][i]) }
        top += 1

        break if top > bottom

        (top..bottom).each { |i| result.append(matrix[i][right]) }
        right -= 1

        break if left > right

        right.downto(left) { |i| result.append(matrix[bottom][i]) }
        bottom -= 1

        break if top > bottom

        bottom.downto(top) { |i| result.append(matrix[i][left]) }
        left += 1

        break if left > right
      end

      result
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    output =  [1, 2, 3, 6, 9, 8, 7, 4, 5]

    assert_equal output, Solution.spiral_order(matrix)
  end

  def test_2
    matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
    output =  [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]

    assert_equal output, Solution.spiral_order(matrix)
  end

  def test_3
    matrix = [[7], [9], [6]]
    output =  [7, 9, 6]

    assert_equal output, Solution.spiral_order(matrix)
  end
end
