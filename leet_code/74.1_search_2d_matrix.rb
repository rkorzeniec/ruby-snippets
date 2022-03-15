# frozen_string_literal: true

# https://leetcode.com/problems/search-a-2d-matrix/

require_relative '../test_helper'

# Runtime: 44 ms, faster than 98.25% of Ruby online submissions for Search a 2D Matrix.
# Memory Usage: 211.3 MB, less than 19.30% of Ruby online submissions for Search a 2D Matrix.
class Solution
  class << self
    def search_matrix(matrix, target)
      row_index = find_row_index(matrix, target)

      return false if row_index < 0

      binary_search(matrix[row_index], target)
    end

    def find_row_index(matrix, target)
      return -1 if target < matrix[0][0]

      length = matrix.size

      matrix.each_with_index do |_, index|
        return index if matrix[index][0] == target
        return index unless index + 1 < length
        return index if matrix[index + 1][0] > target
      end

      -1
    end

    def binary_search(numbers, target)
      low = 0
      high = numbers.size - 1

      while low <= high
        pivot = (low + high) / 2

        if numbers[pivot] < target
          low = pivot + 1
        elsif numbers[pivot] > target
          high = pivot - 1
        else
          return true
        end
      end

      false
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    matrix = [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]]
    target = 3

    assert_equal true, Solution.search_matrix(matrix, target)
  end

  def test_2
    matrix = [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]]
    target = 13

    assert_equal false, Solution.search_matrix(matrix, target)
  end

  def test_3
    matrix = [[1]]
    target = 0

    assert_equal false, Solution.search_matrix(matrix, target)
  end

  def test_4
    matrix = [[1]]
    target = 1

    assert_equal true, Solution.search_matrix(matrix, target)
  end

  def test_5
    matrix = [[1, 3]]
    target = 3

    assert_equal true, Solution.search_matrix(matrix, target)
  end
end
