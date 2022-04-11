# frozen_string_literal: true

# https://leetcode.com/problems/word-search/

require_relative '../test_helper'

# Time Limit Exceeded
class Solution
  class << self
    def exist(board, word)
      board.size.times do |row|
        board[row].size.times do |col|
          next if board[row][col] != word[0]

          return true if find_word(board, row, col, word)
        end
      end

      false
    end

    def find_word(board, row, col, word)
      return true if word.size.zero?
      return false if row < 0 || row >= board.size
      return false if col < 0 || col >= board[row].size
      return false if word[0] != board[row][col]

      board[row][col] = '#'
      result =
        find_word(board, row - 1, col, word[1..]) ||
        find_word(board, row, col - 1, word[1..]) ||
        find_word(board, row + 1, col, word[1..]) ||
        find_word(board, row, col + 1, word[1..])

      board[row][col] = word[0]
      result
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    board = [['A', 'B', 'C', 'E'], ['S', 'F', 'C', 'S'], ['A', 'D', 'E', 'E']]
    word = 'ABCCED'
    output = true

    assert_equal output, Solution.exist(board, word)
  end

  def test_2
    board = [['A', 'B', 'C', 'E'], ['S', 'F', 'C', 'S'], ['A', 'D', 'E', 'E']]
    word = 'SEE'
    output = true

    assert_equal output, Solution.exist(board, word)
  end

  def test_3
    board = [['A', 'B', 'C', 'E'], ['S', 'F', 'C', 'S'], ['A', 'D', 'E', 'E']]
    word = 'ABCB'
    output = false

    assert_equal output, Solution.exist(board, word)
  end
end
