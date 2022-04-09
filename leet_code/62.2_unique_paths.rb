# frozen_string_literal: true

# https://leetcode.com/problems/unique-paths/

require_relative '../test_helper'

# Runtime: 64 ms, faster than 95.24% of Ruby online submissions for Unique Paths.
# Memory Usage: 211 MB, less than 46.67% of Ruby online submissions for Unique Paths.
class Solution
  class << self
    def unique_paths(m, n)
      return 0 if m < 1 || n < 1

      path = 1
      (n...(m + n - 1)).each do |i|
        path *= i
        path /= (i - n + 1)
      end

      path
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    m = 3
    n = 7
    output = 28

    assert_equal output, Solution.unique_paths(m, n)
  end

  def test_2
    m = 3
    n = 2
    output = 3

    assert_equal output, Solution.unique_paths(m, n)
  end
end
