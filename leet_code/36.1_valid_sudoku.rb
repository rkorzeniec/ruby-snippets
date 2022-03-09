# frozen_string_literal: true

# https://leetcode.com/problems/valid-sudoku/

require 'minitest/autorun'

# Runtime: 131 ms, faster than 57.81% of Ruby online submissions for Valid Sudoku.
# Memory Usage: 210.8 MB, less than 60.16% of Ruby online submissions for Valid Sudoku.
class Solution
  class << self
    def is_valid_sudoku(board)
      validate_rows(board) &&
        validate_columns(board) &&
        validate_squares(board)
    end

    def validate_rows(board)
      board.all? { |row| validate_row(row) }
    end

    def validate_columns(board)
      board[0].size.times.all? { |col_index| validate_column(board, col_index) }
    end

    def validate_squares(board)
      3.times.all? do |i|
        row_offset = i * 3

        3.times.all? do |j|
          col_offset = j * 3

          flattened_square = flatten_square(board, row_offset, col_offset)
          validate_row(flattened_square)
        end
      end
    end

    def validate_row(row)
      numbers = {}

      row.all? { |num| valid_number?(num, numbers) }
    end

    def validate_column(board, col_index)
      numbers = {}

      board.size.times.all? do |row_index|
        num = board[row_index][col_index]
        valid_number?(num, numbers)
      end
    end

    def flatten_square(board, row_offset, col_offset)
      flattened_square = []

      3.times do |i|
        3.times do |j|
          flattened_square.append(board[i + row_offset][j + col_offset])
        end
      end

      flattened_square
    end

    def valid_number?(num, cache)
      return true if num == '.'

      num = num.to_i
      return false if num < 1
      return false if num > 9
      return false if cache.key?(num)

      cache[num] = true
      true
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
