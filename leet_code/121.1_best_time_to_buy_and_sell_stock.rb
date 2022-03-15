# frozen_string_literal: true

# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

require_relative '../test_helper'

# Runtime: 245 ms, faster than 52.51% of Ruby online submissions for Best Time to Buy and Sell Stock.
# Memory Usage: 220.7 MB, less than 60.66% of Ruby online submissions for Best Time to Buy and Sell Stock.
class Solution
  class << self
    def max_profit(prices)
      max_profit = 0
      current_buy = Float::INFINITY
      current_sell = -Float::INFINITY

      prices.each do |price|
        if price < current_buy
          current_buy = price
          current_sell = -Float::INFINITY
        end

        current_sell = price if price > current_sell

        current_profit = current_sell - current_buy
        max_profit = current_profit if current_profit > max_profit
      end

      max_profit
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal 5, Solution.max_profit([7, 1, 5, 3, 6, 4])
  end

  def test_2
    assert_equal 0, Solution.max_profit([7, 6, 4, 3, 1])
  end
end
