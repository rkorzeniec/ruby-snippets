# frozen_string_literal: true

# https://leetcode.com/problems/set-matrix-zeroes/

require_relative '../test_helper'

# Runtime: 92 ms, faster than 97.65% of Ruby online submissions for Set Matrix Zeroes.
# Memory Usage: 212.2 MB, less than 49.41% of Ruby online submissions for Set Matrix Zeroes.
class Solution
  class << self
    def set_zeroes(matrix)
      column = false

      matrix.size.times do |row|
        column = true if matrix[row][0].zero?

        (1...matrix[0].size).each do |col|
          next unless matrix[row][col].zero?

          matrix[row][0] = 0
          matrix[0][col] = 0
        end
      end

      (1...matrix.size).each do |row|
        (1...matrix[0].size).each do |col|
          next unless matrix[row][0].zero? || matrix[0][col].zero?

          matrix[row][col] = 0
        end
      end

      if matrix[0][0].zero?
        matrix[0].size.times do |i|
          matrix[0][i] = 0
        end
      end

      return unless column

      matrix.size.times do |i|
        matrix[i][0] = 0
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    matrix = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
    output = [[1, 0, 1], [0, 0, 0], [1, 0, 1]]

    Solution.set_zeroes(matrix)

    assert_equal output, matrix
  end

  def test_2
    matrix = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
    output = [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]

    Solution.set_zeroes(matrix)

    assert_equal output, matrix
  end
end
