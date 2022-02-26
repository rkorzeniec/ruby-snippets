# frozen_string_literal: true

# Given an image represented by an NxN matrix,
# where each pixel in the image is 4 bytes,
# write a method to rotate the image by 90 degrees.
# Can you do this in place?

require 'minitest/autorun'

class MatrixRotator
  def initialize(matrix)
    @matrix = matrix
  end

  def call
    return false if matrix_length.zero? || uneven_matrix?

    rotate_matrix
    matrix
  end

  private

  attr_reader :matrix

  def matrix_length
    @matrix_length ||= matrix.length
  end

  def uneven_matrix?
    matrix_length != matrix[0].length
  end

  def rotate_matrix
    (matrix_length / 2).times do |first|
      last = matrix_length - 1 - first

      (first...last).each do |index|
        offset = index - first
        top = matrix[first][index]

        rotate_left_to_top(first, last - offset, index)
        rotate_bottom_to_left(first, last, last - offset)
        rotate_right_to_bottom(index, last, last - offset)
        rotate_top_to_right(top, last, index)
      end
    end
  end

  def rotate_left_to_top(first, offset_last, index)
    matrix[first][index] = matrix[offset_last][first]
  end

  def rotate_bottom_to_left(first, last, offset_last)
    matrix[offset_last][first] = matrix[last][offset_last]
  end

  def rotate_right_to_bottom(index, last, offset_last)
    matrix[last][offset_last] = matrix[index][last]
  end

  def rotate_top_to_right(top, last, index)
    matrix[index][last] = top
  end
end

class TestMatrixRotator < Minitest::Test
  def test_1
    matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    exp_matrix = [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]

    assert_equal exp_matrix, MatrixRotator.new(matrix).call
  end
end
