# frozen_string_literal: true

# https://leetcode.com/problems/number-of-islands/

require 'minitest/autorun'

# Runtime: 132 ms, faster than 67.71% of Ruby online submissions for Max Area of Island.
# Memory Usage: 212.6 MB, less than 17.71% of Ruby online submissions for Max Area of Island.
class Solution
  class << self
    def max_area_of_island(grid)
      counts = [0]

      grid.size.times do |row|
        grid[row].size.times do |col|
          next if grid[row][col] == 0

          result = dfs(grid:, row:, col:)
          counts.append(result) if result > 0
        end
      end

      counts.max
    end

    def dfs(grid:, row:, col:)
      return 0 if grid[row][col] != 1

      grid[row][col] = 0

      result = 1

      # north
      result += dfs(grid:, row: row - 1, col:) if row >= 1

      # south
      result += dfs(grid:, row: row + 1, col:) if row + 1 < grid.size

      # east
      result += dfs(grid:, row:, col: col - 1) if col >= 1

      # west
      result += dfs(grid:, row:, col: col + 1) if col + 1 < grid[0].size

      result
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    grid = [
      [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
      [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]
    ]
    output = 6

    assert_equal output, Solution.max_area_of_island(grid)
  end

  def test_2
    grid = [[0, 0, 0, 0, 0, 0, 0, 0]]
    output = 0

    assert_equal output, Solution.max_area_of_island(grid)
  end
end
