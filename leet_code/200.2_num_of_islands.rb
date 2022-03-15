# frozen_string_literal: true

# https://leetcode.com/problems/number-of-islands/

require_relative '../test_helper'

# Runtime: 244 ms, faster than 61.11% of Ruby online submissions for Number of Islands.
# Memory Usage: 219.4 MB, less than 68.18% of Ruby online submissions for Number of Islands.
class Solution
  class << self
    def num_islands(grid)
      count = 0

      visited = grid.map do |row|
        row.map { |_| false }
      end

      grid.size.times do |row|
        grid[row].size.times do |col|
          next if visited[row][col]
          next if grid[row][col] != '1'

          dfs(grid:, row:, col:, visited:)
          count += 1
        end
      end

      count
    end

    def dfs(grid:, row:, col:, visited:)
      return if visited[row][col]
      return if grid[row][col] != '1'

      visited[row][col] = true

      # north
      dfs(grid:, row: row - 1, col:, visited:) if row >= 1

      # south
      dfs(grid:, row: row + 1, col:, visited:) if row + 1 < grid.size

      # east
      dfs(grid:, row:, col: col - 1, visited:) if col >= 1

      # west
      dfs(grid:, row:, col: col + 1, visited:) if col + 1 < grid[0].size
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    grid = [
      %w[1 1 1 1 0],
      %w[1 1 0 1 0],
      %w[1 1 0 0 0],
      %w[0 0 0 0 0]
    ]
    output = 1

    assert_equal output, Solution.num_islands(grid)
  end

  def test_2
    grid = [
      %w[1 1 0 0 0],
      %w[1 1 0 0 0],
      %w[0 0 1 0 0],
      %w[0 0 0 1 1]
    ]
    output = 3

    assert_equal output, Solution.num_islands(grid)
  end

  def test_3
    grid = [
      %w[1 1 1],
      %w[0 1 1],
      %w[1 1 1]
    ]

    output = 1

    assert_equal output, Solution.num_islands(grid)
  end
end
