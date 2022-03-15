# frozen_string_literal: true

# https://leetcode.com/problems/flood-fill/

require_relative '../test_helper'

# Runtime: 110 ms, faster than 58.24% of Ruby online submissions for Flood Fill.
# Memory Usage: 211.4 MB, less than 23.08% of Ruby online submissions for Flood Fill.
class Solution
  class << self
    def flood_fill(image, sr, sc, new_color)
      rows = image.size
      cols = image[0].size
      color = image[sr][sc]

      return image if new_color == color

      fill(image:, rows:, cols:, r: sr, c: sc, color:, new_color:)
      image
    end

    def fill(image:, rows:, cols:, r:, c:, color:, new_color:)
      return unless image[r][c] == color

      image[r][c] = new_color

      # north
      fill(image:, rows:, cols:, r: r - 1, c:, color:, new_color:) if r >= 1

      # south
      fill(image:, rows:, cols:, r: r + 1, c:, color:, new_color:) if r + 1 < rows

      # east
      fill(image:, rows:, cols:, r:, c: c - 1, color:, new_color:) if c >= 1

      # west
      fill(image:, rows:, cols:, r:, c: c + 1, color:, new_color:) if c + 1 < cols

      image
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
