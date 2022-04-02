# frozen_string_literal: true

# https://leetcode.com/problems/rotting-oranges/

require_relative '../test_helper'

# Runtime: 76 ms, faster than 91.23% of Ruby online submissions for Rotting Oranges.
# Memory Usage: 211.2 MB, less than 28.07% of Ruby online submissions for Rotting Oranges.
class Solution
  class << self
    def oranges_rotting(grid)
      return if grid.size.zero?

      fresh_count = 0
      minutes = 0
      queue = []

      grid.size.times do |row|
        grid[row].size.times do |col|
          case grid[row][col]
          when 2 then queue.append([row, col])
          when 1 then fresh_count += 1
          end
        end
      end

      while !queue.empty? && fresh_count.positive?
        minutes += 1

        queue.size.times do |_|
          row, col = queue.shift

          [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |dx, dy|
            x = dx + row
            y = dy + col

            next if x.negative? || x == grid.size || y.negative? || y == grid[x].size
            next if grid[x][y] == 0 || grid[x][y] == 2

            fresh_count -= 1
            grid[x][y] = 2
            queue.append([x, y])
          end
        end
      end

      fresh_count.positive? ? -1 : minutes
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    grid = [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
    output = 4

    assert_equal output, Solution.oranges_rotting(grid)
  end

  def test_2
    grid = [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
    output = -1

    assert_equal output, Solution.oranges_rotting(grid)
  end

  def test_3
    grid = [[0, 2]]
    output = 0

    assert_equal output, Solution.oranges_rotting(grid)
  end

  def test_4
    grid = [[1, 2]]
    output = 1

    assert_equal output, Solution.oranges_rotting(grid)
  end

  def test_5
    grid = [[2, 1, 1], [1, 1, 1], [0, 1, 2]]
    output = 2

    assert_equal output, Solution.oranges_rotting(grid)
  end

  def test_6
    grid = [[0]]
    output = 0

    assert_equal output, Solution.oranges_rotting(grid)
  end

  def test_7
    grid = [[1]]
    output = -1

    assert_equal output, Solution.oranges_rotting(grid)
  end

  def test_8
    grid = [[2, 2], [1, 1], [0, 0], [2, 0]]
    output = 1

    assert_equal output, Solution.oranges_rotting(grid)
  end
end
