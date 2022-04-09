# frozen_string_literal: true

# https://leetcode.com/problems/unique-paths/

require_relative '../test_helper'

# Time Limit Exceeded
class Solution
  class << self
    def unique_paths(m, n)
      return if m < 1 || n < 1

      sum_paths(m - 1, n - 1)
    end

    def sum_paths(m, n)
      return 1 if m < 1 || n < 1

      sum_paths(m - 1, n) + sum_paths(m, n - 1)
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
