# frozen_string_literal: true

# https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/

require 'minitest/autorun'

# Runtime: 64 ms, faster than 96.97% of Ruby online submissions for Count Odd Numbers in an Interval Range.
# Memory Usage: 211.1 MB, less than 15.15% of Ruby online submissions for Count Odd Numbers in an Interval Range.
class Solution
  class << self
    def count_odds(low, high)
      return (high - low + 1) / 2 if low % 2 == 0

      ((high - low) / 2) + 1
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    low = 3
    high = 7
    output = 3

    assert_equal output, Solution.count_odds(low, high)
  end

  def test_2
    low = 8
    high = 10
    output = 1

    assert_equal output, Solution.count_odds(low, high)
  end

  def test_3
    low = 800_445_804
    high = 979_430_543
    output = 89_492_370

    assert_equal output, Solution.count_odds(low, high)
  end
end
