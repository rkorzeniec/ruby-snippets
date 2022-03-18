# frozen_string_literal: true

# https://leetcode.com/problems/count-sub-islands/

require_relative '../test_helper'

# Runtime: 768 ms, faster than 72.73% of Ruby online submissions for Count Sub Islands.
# Memory Usage: 262.3 MB, less than 9.09% of Ruby online submissions for Count Sub Islands.
class Solution
  class << self
    def count_sub_islands(grid1, grid2)
      count = 0

      grid2.size.times do |row|
        grid2[0].size.times do |col|
          fill(grid1:, grid2:, row:, col:) if grid2[row][col] == 1 && grid1[row][col] == 0
        end
      end

      grid2.size.times do |row|
        grid2[0].size.times do |col|
          next unless grid2[row][col] == 1

          fill(grid1:, grid2:, row:, col:)

          count += 1
        end
      end

      count
    end

    def fill(grid1:, grid2:, row:, col:)
      return if row.negative? || row >= grid2.size
      return if col.negative? || col >= grid2[0].size
      return if grid2[row][col].zero?

      grid2[row][col] = 0

      # north
      fill(grid1:, grid2:, row: row - 1, col:)

      # south
      fill(grid1:, grid2:, row: row + 1, col:)

      # east
      fill(grid1:, grid2:, row:, col: col - 1)

      # west
      fill(grid1:, grid2:, row:, col: col + 1)
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    grid1 = [
      [1, 1, 1, 0, 0],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 0, 1, 1]
    ]

    grid2 = [
      [1, 1, 1, 0, 0],
      [0, 0, 1, 1, 1],
      [0, 1, 0, 0, 0],
      [1, 0, 1, 1, 0],
      [0, 1, 0, 1, 0]
    ]

    output = 3

    assert_equal output, Solution.count_sub_islands(grid1, grid2)
  end

  def test_2
    grid1 = [
      [1, 0, 1, 0, 1],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
      [1, 0, 1, 0, 1]
    ]
    grid2 = [
      [0, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
      [0, 1, 0, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 0, 1]
    ]
    output = 2

    assert_equal output, Solution.count_sub_islands(grid1, grid2)
  end
end
