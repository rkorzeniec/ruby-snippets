# frozen_string_literal: true

# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

require_relative '../test_helper'

# Runtime: 248 ms, faster than 50.95% of Ruby online submissions for Best Time to Buy and Sell Stock.
# Memory Usage: 220.8 MB, less than 60.66% of Ruby online submissions for Best Time to Buy and Sell Stock.
class Solution
  class << self
    def max_profit(prices)
      max_profit = 0
      buy = 0
      sell = 1

      while sell < prices.size
        current_profit = prices[sell] - prices[buy]

        if prices[buy] < prices[sell]
          max_profit = [max_profit, current_profit].max
        else
          buy = sell
        end

        sell += 1
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
