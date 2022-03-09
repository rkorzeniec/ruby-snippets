# frozen_string_literal: true

# https://leetcode.com/problems/valid-sudoku/

require 'minitest/autorun'

# Runtime: 110 ms, faster than 68.75% of Ruby online submissions for Valid Sudoku.
# Memory Usage: 211 MB, less than 38.28% of Ruby online submissions for Valid Sudoku.
class Solution
  class << self
    def is_valid_sudoku(board)
      !(0..80).flat_map do |i|
        row = i / 9
        col = i % 9
        value = board[row][col]

        if value > '.'
          [[value, row], [col, value], [row / 3, col / 3, value]]
        else
          i
        end
      end.uniq!
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    board =
      [
        ['5', '3', '.', '.', '7', '.', '.', '.', '.'],
        ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
        ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
        ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
        ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
        ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
        ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
        ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
        ['.', '.', '.', '.', '8', '.', '.', '7', '9']
      ]

    assert_equal true, Solution.is_valid_sudoku(board)
  end

  def test_2
    board =
      [
        ['8', '3', '.', '.', '7', '.', '.', '.', '.'],
        ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
        ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
        ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
        ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
        ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
        ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
        ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
        ['.', '.', '.', '.', '8', '.', '.', '7', '9']
      ]

    assert_equal false, Solution.is_valid_sudoku(board)
  end

  def test_3
    board =
      [
        ['8', '3', '.', '.', '7', '.', '.', '.', '.'],
        ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
        ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
        ['2', '.', '.', '.', '6', '.', '.', '.', '3'],
        ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
        ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
        ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
        ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
        ['.', '.', '.', '.', '8', '.', '.', '7', '9']
      ]

    assert_equal false, Solution.is_valid_sudoku(board)
  end
end
