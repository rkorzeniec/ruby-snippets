# frozen_string_literal: true

# https://leetcode.com/problems/set-matrix-zeroes/

require_relative '../test_helper'
require 'set'

# Runtime: 92 ms, faster than 97.65% of Ruby online submissions for Set Matrix Zeroes.
# Memory Usage: 212.2 MB, less than 49.41% of Ruby online submissions for Set Matrix Zeroes.
class Solution
  class << self
    def set_zeroes(matrix)
      rows = Set.new
      cols = Set.new

      matrix.size.times do |row|
        matrix[0].size.times do |col|
          next unless matrix[row][col].zero?

          rows.add(row)
          cols.add(col)
        end
      end

      rows.each do |row|
        matrix[row].size.times do |col|
          matrix[row][col] = 0
        end
      end

      matrix.size.times do |row|
        cols.each do |col|
          matrix[row][col] = 0
        end
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
