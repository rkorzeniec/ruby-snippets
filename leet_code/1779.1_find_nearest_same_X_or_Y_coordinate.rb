# frozen_string_literal: true

# https://leetcode.com/problems/find-nearest-point-that-has-the-same-x-or-y-coordinate/

require_relative '../test_helper'

# Runtime: 190 ms, faster than 50.00% of Ruby online submissions for Find Nearest Point That Has the Same X or Y Coordinate.
# Memory Usage: 212.7 MB, less than 40.00% of Ruby online submissions for Find Nearest Point That Has the Same X or Y Coordinate.
class Solution
  class << self
    def nearest_valid_point(x, y, points)
      min_distance_index = nil
      min_distance = Float::INFINITY

      points.each_with_index do |point, index|
        next unless point[0] == x || point[1] == y

        distance = (x - point[0]).abs + (y - point[1]).abs

        next unless  distance < min_distance

        min_distance = distance
        min_distance_index = index
      end

      min_distance_index || -1
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    x = 3
    y = 4
    points = [[1, 2], [3, 1], [2, 4], [2, 3], [4, 4]]
    output = 2

    assert_equal output, Solution.nearest_valid_point(x, y, points)
  end

  def test_2
    x = 3
    y = 4
    points = [[3, 4]]
    output = 0

    assert_equal output, Solution.nearest_valid_point(x, y, points)
  end

  def test_3
    x = 3
    y = 4
    points = [[2, 3]]
    output = -1

    assert_equal output, Solution.nearest_valid_point(x, y, points)
  end
end
