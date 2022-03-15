# frozen_string_literal: true

# https://leetcode.com/problems/number-of-enclaves/

require_relative '../test_helper'

# Runtime: 200 ms, faster than 83.33% of Ruby online submissions for Number of Enclaves.
# Memory Usage: 222 MB, less than 50.00% of Ruby online submissions for Number of Enclaves.
class Solution
  class << self
    def num_enclaves(grid)
      count = 0
      rows = grid.size
      cols = grid[0].size

      rows.times do |row|
        cols.times do |col|
          next if grid[row][col] == 0

          if row.zero? || row == rows - 1 || col.zero? || col == cols - 1
            edge_convert(grid:, row:, col:)
          end
        end
      end

      # grid.each { |g| puts g.inspect}

      rows.times do |row|
        cols.times do |col|
          next if grid[row][col] == 0

          count += 1
        end
      end

      count
    end

    def edge_convert(grid:, row:, col:)
      return if grid[row][col] == 0

      grid[row][col] = 0

      # north
      edge_convert(grid:, row: row - 1, col:) if row >= 1

      # south
      edge_convert(grid:, row: row + 1, col:) if row + 1 < grid.size

      # east
      edge_convert(grid:, row:, col: col - 1) if col >= 1

      # west
      edge_convert(grid:, row:, col: col + 1) if col + 1 < grid[0].size
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    grid = [
      [0, 0, 0, 0],
      [1, 0, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0]
    ]
    output = 3

    assert_equal output, Solution.num_enclaves(grid)
  end

  def test_2
    grid = [
      [0, 1, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0]
    ]
    output = 0

    assert_equal output, Solution.num_enclaves(grid)
  end
end
