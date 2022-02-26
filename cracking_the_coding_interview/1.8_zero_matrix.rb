# frozen_string_literal: true

# Write an algorithm such that if an element in an MxN matrix is 0,
# its entire row and column are set to 0.

require 'minitest/autorun'

class ZeroMatrix
  def initialize(matrix)
    @matrix = matrix
    @rows = []
    @columns = []
  end

  def call
    scan_matrix
    nullify_rows
    nullify_columns

    matrix
  end

  private

  attr_reader :matrix, :rows, :columns

  def scan_matrix
    matrix.each_with_index do |row, row_index|
      row.each_with_index do |element, column_index|
        next unless element.zero?

        rows.append(row_index)
        columns.append(column_index)
      end
    end
  end

  def nullify_rows
    rows.each do |row_index|
      matrix[row_index].length.times do |index|
        matrix[row_index][index] = 0
      end
    end
  end

  def nullify_columns
    columns.each do |column_index|
      matrix.each do |row|
        row[column_index] = 0
      end
    end
  end
end

class TestZeroMatrix < Minitest::Test
  def test_1
    matrix = [[1, 2, 0, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 0]]
    exp_matrix = [[0, 0, 0, 0], [5, 6, 0, 0], [9, 10, 0, 0], [0, 0, 0, 0]]

    assert_equal exp_matrix, ZeroMatrix.new(matrix).call
  end
end
