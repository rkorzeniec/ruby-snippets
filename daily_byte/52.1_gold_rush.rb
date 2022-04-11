# frozen_string_literal: true

# This question is asked by Amazon.

# Given a 2D matrix that represents a gold mine,
# where each cell’s value represents an amount of gold,
# return the maximum amount of gold you can collect given the following rules:

# You may start and stop collecting gold from any position
# You can never visit a cell that contains 0 gold
# You cannot visit the same cell more than once
# From the current cell, you may walk one cell to the left, right, up, or down

# Ex: Given the following gold mine…
# goldMine = [
#     [0,2,0],
#     [8,6,3],
#     [0,9,0]
# ],
# return 23 (start at 9 and then move to 6 and 8 respectively)

require_relative '../test_helper'

class Solution
  def max_gold(gold_mine)
    gold_paths = []
    gold_mine.size.times do |row|
      gold_mine[row].size.times do |col|
        next if gold_mine[row][col].zero?

        gold_paths.append(gold_path(gold_mine, row, col))
      end
    end

    gold_paths.max
  end

  def gold_path(gold_mine, row, col, sum: 0)
    temp = gold_mine[row][col]
    sum += temp
    gold_mine[row][col] = 0

    next_cell = find_next_cell(gold_mine, row, col)
    sum += gold_path(gold_mine, next_cell[0], next_cell[1]) if next_cell

    gold_mine[row][col] = temp

    sum
  end

  def find_next_cell(gold_mine, row, col)
    next_cell = nil
    max = 0

    [[row + 1, col], [row, col + 1], [row - 1, col], [row, col - 1]].each do |d|
      next unless within_bounds?(gold_mine, d[0], d[1])

      value = gold_mine[d[0]][d[1]]
      next unless value > max

      next_cell = d
      max = value
    end

    next_cell
  end

  def within_bounds?(matrix, row, col)
    return false if row.negative? || row >= matrix.size
    return false if col.negative? || col >= matrix[row].size

    true
  end
end

class Test < Minitest::Test
  def test_1
    gold_mine = [
      [0, 2, 0],
      [8, 6, 3],
      [0, 9, 0]
    ]
    output = 23

    assert_equal output, Solution.new.max_gold(gold_mine)
  end
end
