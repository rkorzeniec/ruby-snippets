# frozen_string_literal: true

# https://leetcode.com/problems/reshape-the-matrix/

require_relative '../test_helper'

# Runtime: 125 ms, faster than 49.12% of Ruby online submissions for Reshape the Matrix.
# Memory Usage: 211.6 MB, less than 21.05% of Ruby online submissions for Reshape the Matrix.
class Solution
  class << self
    def matrix_reshape(mat, r, c)
      return mat unless validate(mat, r, c)

      flatttened_mat = flattened_matrix(mat)

      return [flatttened_mat] if r == 1

      result = []
      matrix_index = 0
      r.times do |i|
        result.append([])
        c.times do |j|
          result[i].append(flatttened_mat[matrix_index])
          matrix_index += 1
        end
      end

      result
    end

    def validate(mat, r, c)
      (mat.size * mat[0].size) == (r * c)
    end

    def flattened_matrix(mat)
      flatttened_mat = []

      mat.each do |row|
        row.each { |num| flatttened_mat.append(num)}
      end

      flatttened_mat
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
