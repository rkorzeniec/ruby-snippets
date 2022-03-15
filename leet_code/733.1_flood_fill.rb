# frozen_string_literal: true

# https://leetcode.com/problems/flood-fill/

require_relative '../test_helper'

# Runtime: 126 ms, faster than 41.76% of Ruby online submissions for Flood Fill.
# Memory Usage: 211.2 MB, less than 53.85% of Ruby online submissions for Flood Fill.
class Solution
  class << self
    def flood_fill(image, sr, sc, new_color)
      fill_neighbour(image:, row: sr, col: sc, new_color:, old_color: image[sr][sc])
      image
    end

    def fill_neighbour(image:, row:, col:, new_color:, old_color:)
      return if row < 0 || row >= image.size
      return if col < 0 || col >= image[0].size
      return if image[row][col] == new_color
      return if image[row][col] != old_color

      image[row][col] = new_color

      fill_neighbour(image:, row: row - 1, col:, new_color:, old_color:)
      fill_neighbour(image:, row:, col: col + 1, new_color:, old_color:)
      fill_neighbour(image:, row: row + 1, col:, new_color:, old_color:)
      fill_neighbour(image:, row:, col: col - 1, new_color:, old_color:)
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
    sr = 1
    sc = 1
    new_color = 2
    output = [[2, 2, 2], [2, 2, 0], [2, 0, 1]]

    assert_equal output, Solution.flood_fill(image, sr, sc, new_color)
  end

  def test_2
    image = [[0, 0, 0], [0, 0, 0]]
    sr = 0
    sc = 0
    new_color = 2
    output = [[2, 2, 2], [2, 2, 2]]

    assert_equal output, Solution.flood_fill(image, sr, sc, new_color)
  end

  def test_3
    image = [[0, 0, 0], [0, 1, 1]]
    sr = 1
    sc = 1
    new_color = 1
    output = [[0, 0, 0], [0, 1, 1]]

    assert_equal output, Solution.flood_fill(image, sr, sc, new_color)
  end
end
