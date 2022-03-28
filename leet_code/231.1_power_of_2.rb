# frozen_string_literal: true

# https://leetcode.com/problems/power-of-two/

require_relative '../test_helper'


class Solution
  class << self
    def is_power_of_two(n)
      return false if n.zero?

      log = Math.log(n, 10) / Math.log(2, 10)

      log.ceil == log.floor
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
