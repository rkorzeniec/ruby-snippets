# frozen_string_literal: true

# https://leetcode.com/problems/number-of-closed-islands/

require_relative '../test_helper'

# Runtime: 115 ms, faster than 71.43% of Ruby online submissions for Number of Closed Islands.
# Memory Usage: 212.3 MB, less than 28.57% of Ruby online submissions for Number of Closed Islands.
class Solution
  class << self
    def closed_island(grid)
      count = 0
      rows = grid.size
      cols = grid[0].size

      rows.times do |row|
        cols.times do |col|
          next if grid[row][col] == 1

          if row.zero? || row == rows - 1 || col.zero? || col == cols - 1
            edge_convert(grid:, row:, col:)
          end
        end
      end

      rows.times do |row|
        cols.times do |col|
          next if grid[row][col] == 1

          count += dfs(grid:, row:, col:)
        end
      end

      count
    end

    def edge_convert(grid:, row:, col:)
      return if grid[row][col] == 1

      grid[row][col] = 1

      # north
      edge_convert(grid:, row: row - 1, col:) if row >= 1

      # south
      edge_convert(grid:, row: row + 1, col:) if row + 1 < grid.size

      # east
      edge_convert(grid:, row:, col: col - 1) if col >= 1

      # west
      edge_convert(grid:, row:, col: col + 1) if col + 1 < grid[0].size
    end

    def dfs(grid:, row:, col:)
      return 0 if grid[row][col] != 0

      grid[row][col] = 1

      # north
      dfs(grid:, row: row - 1, col:) if row >= 1

      # south
      dfs(grid:, row: row + 1, col:) if row + 1 < grid.size

      # east
      dfs(grid:, row:, col: col - 1) if col >= 1

      # west
      dfs(grid:, row:, col: col + 1) if col + 1 < grid[0].size

      1
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    grid = [
      [1, 1, 1, 1, 1, 1, 1, 0],
      [1, 0, 0, 0, 0, 1, 1, 0],
      [1, 0, 1, 0, 1, 1, 1, 0],
      [1, 0, 0, 0, 0, 1, 0, 1],
      [1, 1, 1, 1, 1, 1, 1, 0]
    ]
    output = 2

    assert_equal output, Solution.closed_island(grid)
  end

  def test_2
    grid = [
      [0, 0, 1, 0, 0],
      [0, 1, 0, 1, 0],
      [0, 1, 1, 1, 0]
    ]
    output = 1

    assert_equal output, Solution.closed_island(grid)
  end

  def test_3
    grid = [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0, 0, 1],
      [1, 0, 1, 1, 1, 0, 1],
      [1, 0, 1, 0, 1, 0, 1],
      [1, 0, 1, 1, 1, 0, 1],
      [1, 0, 0, 0, 0, 0, 1],
      [1, 1, 1, 1, 1, 1, 1]
    ]
    output = 2

    assert_equal output, Solution.closed_island(grid)
  end

  def test_4
    grid = [
      [0, 0, 1, 1, 0, 1, 0, 0, 1, 0],
      [1, 1, 0, 1, 1, 0, 1, 1, 1, 0],
      [1, 0, 1, 1, 1, 0, 0, 1, 1, 0],
      [0, 1, 1, 0, 0, 0, 0, 1, 0, 1],
      [0, 0, 0, 0, 0, 0, 1, 1, 1, 0],
      [0, 1, 0, 1, 0, 1, 0, 1, 1, 1],
      [1, 0, 1, 0, 1, 1, 0, 0, 0, 1],
      [1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 1, 0, 1, 0, 1],
      [1, 1, 1, 0, 1, 1, 0, 1, 1, 0]
    ]
    output = 5

    assert_equal output, Solution.closed_island(grid)
  end
end
