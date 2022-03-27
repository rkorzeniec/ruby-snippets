# frozen_string_literal: true

require_relative '../test_helper'
require 'set'

# https://leetcode.com/problems/01-matrix/

# Runtime: 1209 ms, faster than 10.81% of Ruby online submissions for 01 Matrix.
# Memory Usage: 216.3 MB, less than 18.92% of Ruby online submissions for 01 Matrix.
class Solution
  def update_matrix(mat)
    visited = Set.new
    queue = []

    mat.size.times do |i|
      mat[0].size.times do |j|
        next unless mat[i][j].zero?

        visited.add([i, j])
        queue.push([i, j])
      end
    end

    dir = [[1, 0], [0, 1], [-1, 0], [0, -1]]

    until queue.empty?
      queue.size.times do
        i, j = queue.shift

        dir.each do |x, y|
          dx = i + x
          dy = j + y

          next unless dx >= 0 &&
                      dy >= 0 &&
                      dx < mat.size &&
                      dy < mat[0].size &&
                      !visited.include?([dx, dy])

          visited.add([dx, dy])
          queue.push([dx, dy])
          mat[dx][dy] = mat[i][j] + 1
        end
      end
    end

    mat
  end
end

class Test < Minitest::Test
  def test_1
    mat = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
    output = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]

    assert_equal output, Solution.new.update_matrix(mat)
  end

  def test_2
    mat = [[0, 0, 0], [0, 1, 0], [1, 1, 1]]
    output = [[0, 0, 0], [0, 1, 0], [1, 2, 1]]

    assert_equal output, Solution.new.update_matrix(mat)
  end
end
