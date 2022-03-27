# frozen_string_literal: true

require_relative '../test_helper'

# https://leetcode.com/problems/01-matrix/


class Solution
  def update_matrix(mat)
    rows = mat.size

    return if rows.zero?

    cols = mat[0].size
    max = rows * cols
    dis = Array.new(rows, Array.new(cols, max))

    (rows - 1).downto(0) do |i|
      (cols - 1).downto(0) do |j|
        if mat[i][j].zero?
          dis[i][j] = 0
        else
          right = j + 1 < cols ? dis[i][j + 1] : max
          down = i + 1 < rows ?  dis[i + 1][j] : max

          dis[i][j] = 1 + [right, down].min
        end
      end
    end

    rows.times do |i|
      cols.times do |j|
        if mat[i][j].zero?
          dis[i][j] = 0
        else
          left = j - 1 >= 0 ? dis[i][j - 1] : max
          top = i - 1 >= 0 ?  dis[i - 1][j] : max
          dis[i][j] = [dis[i][j], 1 + [left, top].min].min
        end
      end
    end

    dis
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
