# frozen_string_literal: true

# This question is asked by Amazon.

# Given a 2D board that represents a word search puzzle and a string word,
# return whether or the given word can be formed in
# the puzzle by only connecting cells horizontally and vertically.

# Ex: Given the following board and words…
# board =
# [
#   ['C','A','T','F'],
#   ['B','G','E','S'],
#   ['I','T','A','E']
# ]
# word = "CAT", return true
# word = "TEA", return true
# word = "SEAT", return true
# word = "BAT", return false

require_relative '../test_helper'

class Solution
  def word_exists?(board, word)
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
    return false if col < 0 || col >= board[0].size
    return false if board[row][col] != word[0]

    board[row][col] = '#'
    subword = word[1..]

    result =
      find_word(board, row - 1, col, subword) ||
      find_word(board, row, col - 1, subword) ||
      find_word(board, row + 1, col, subword) ||
      find_word(board, row, col + 1, subword)

    board[row][col] = word[0]
    result
  end
end

class Test < Minitest::Test
  def test_1
    board =
      [
        ['C','A','T','F'],
        ['B','G','E','S'],
        ['I','T','A','E']
      ]
    word = 'CAT'
    output = true

    assert_equal output, Solution.new.word_exists?(board, word)
  end

  def test_2
    board =
      [
        ['C','A','T','F'],
        ['B','G','E','S'],
        ['I','T','A','E']
      ]
    word = 'TEA'
    output = true

    assert_equal output, Solution.new.word_exists?(board, word)
  end

  def test_3
    board =
      [
        ['C','A','T','F'],
        ['B','G','E','S'],
        ['I','T','A','E']
      ]
    word = 'SEAT'
    output = true

    assert_equal output, Solution.new.word_exists?(board, word)
  end

  def test_4
    board =
      [
        ['C','A','T','F'],
        ['B','G','E','S'],
        ['I','T','A','E']
      ]
    word = 'BAT'
    output = false

    assert_equal output, Solution.new.word_exists?(board, word)
  end
end
