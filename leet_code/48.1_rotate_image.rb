# frozen_string_literal: true

# https://leetcode.com/problems/rotate-image/

require_relative '../test_helper'

# Runtime: 84 ms, faster than 80.20% of Ruby online submissions for Rotate Image.
# Memory Usage: 211 MB, less than 40.59% of Ruby online submissions for Rotate Image.
class Solution
  class << self
    def rotate(matrix)
      (matrix.size / 2).times do |first|
        last = matrix.size - 1 - first

        (first...last).each do |index|
          offset = index - first
          top = matrix[first][index]

          rotate_left_to_top(matrix, first, last - offset, index)
          rotate_bottom_to_left(matrix, first, last, last - offset)
          rotate_right_to_bottom(matrix, index, last, last - offset)
          rotate_top_to_right(matrix, top, last, index)
        end
      end
    end

    def rotate_left_to_top(matrix, first, offset_last, index)
      matrix[first][index] = matrix[offset_last][first]
    end

    def rotate_bottom_to_left(matrix, first, last, offset_last)
      matrix[offset_last][first] = matrix[last][offset_last]
    end

    def rotate_right_to_bottom(matrix, index, last, offset_last)
      matrix[last][offset_last] = matrix[index][last]
    end

    def rotate_top_to_right(matrix, top, last, index)
      matrix[index][last] = top
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    output = [[7, 4, 1], [8, 5, 2], [9, 6, 3]]

    Solution.rotate(matrix)

    assert_equal output, matrix
  end

  def test_2
    matrix = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
    output = [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]]

    Solution.rotate(matrix)

    assert_equal output, matrix
  end
end
