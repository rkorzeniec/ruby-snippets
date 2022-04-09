# frozen_string_literal: true

# https://leetcode.com/problems/unique-paths/

require_relative '../test_helper'

# Runtime: 96 ms, faster than 66.67% of Ruby online submissions for Unique Paths.
# Memory Usage: 211.1 MB, less than 19.05% of Ruby online submissions for Unique Paths.
class Solution
  class << self
    def unique_paths(m, n)
      return if m < 1 || n < 1

      dp = Array.new(n, 1)

      (1...m).each do |_|
        (1...n).each do |j|
          dp[j] = dp[j] + dp[j - 1]
        end
      end

      dp[-1]
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
