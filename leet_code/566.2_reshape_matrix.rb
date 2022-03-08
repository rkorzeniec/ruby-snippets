# frozen_string_literal: true

# https://leetcode.com/problems/reshape-the-matrix/

require 'minitest/autorun'

# Runtime: 92 ms, faster than 71.93% of Ruby online submissions for Reshape the Matrix.
# Memory Usage: 211.5 MB, less than 33.33% of Ruby online submissions for Reshape the Matrix.
class Solution
  class << self
    def matrix_reshape(mat, r, c)
      return mat unless validate(mat, r, c)

      columns = mat[0].size

      result = []
      r.times do |i|
        result[i] = []
        c.times do |j|
          cell = (i * c) + j   # conversion from row,column to offset
          row = cell / columns # gives the row number of old matrix
          col = cell % columns # gives the column number of old matrix
          result[i] << mat[row][col]
        end
      end

      result
    end

    def validate(mat, r, c)
      (mat.size * mat[0].size) == (r * c)
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal [[1, 2, 3, 4]], Solution.matrix_reshape([[1, 2], [3, 4]], 1, 4)
  end

  def test_2
    assert_equal [[1, 2], [3, 4]], Solution.matrix_reshape([[1, 2], [3, 4]], 2, 4)
  end

  def test_3
    assert_equal [[1, 2], [3, 4]], Solution.matrix_reshape([[1, 2, 3, 4]], 2, 2)
  end
end
