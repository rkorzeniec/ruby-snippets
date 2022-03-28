# frozen_string_literal: true

# https://leetcode.com/problems/power-of-two/

require_relative '../test_helper'

# Runtime: 94 ms, faster than 76.56% of Ruby online submissions for Power of Two.
# Memory Usage: 211 MB, less than 81.25% of Ruby online submissions for Power of Two.
class Solution
  class << self
    def is_power_of_two(n)
      return false if n.zero?

      (n & (n - 1)).zero?
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    n = 1
    output = true

    assert_equal output, Solution.is_power_of_two(n)
  end

  def test_2
    n = 16
    output = true

    assert_equal output, Solution.is_power_of_two(n)
  end

  def test_3
    n = 3
    output = false

    assert_equal output, Solution.is_power_of_two(n)
  end
end
