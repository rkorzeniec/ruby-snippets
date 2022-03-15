# frozen_string_literal: true

# https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/

require_relative '../test_helper'

# Runtime: 48 ms, faster than 98.15% of Ruby online submissions for Subtract the Product and Sum of Digits of an Integer.
# Memory Usage: 211.1 MB, less than 48.15% of Ruby online submissions for Subtract the Product and Sum of Digits of an Integer.
class Solution
  class << self
    def subtract_product_and_sum(n)
      digits = n.digits

      product(digits) - sum(digits)
    end

    def product(digits)
      product = 1

      digits.each { |num| product *= num }

      product
    end

    def sum(digits)
      sum = 0

      digits.each { |num| sum += num }

      sum
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    n = 234
    output = 15

    assert_equal output, Solution.subtract_product_and_sum(n)
  end

  def test_2
    n = 4421
    output = 21

    assert_equal output, Solution.subtract_product_and_sum(n)
  end
end
