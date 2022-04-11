# frozen_string_literal: true

# https://leetcode.com/problems/longest-string-chain/

require_relative '../test_helper'

# Runtime: 437 ms, faster than 38.46% of Ruby online submissions for Longest String Chain.
# Memory Usage: 211.6 MB, less than 30.77% of Ruby online submissions for Longest String Chain.
class Solution
  class << self
    def longest_str_chain(words)
      words.sort_by!(&:size)
      dp = {}

      words.each do |word|
        temp = [0]

        word.size.times do |i|
          predecessor = dp[word[0...i] + word[i + 1..]]
          temp << predecessor if predecessor

          dp[word] = temp.max + 1
        end
      end

      dp.values.max
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    words = ['a', 'b', 'ba', 'bca', 'bda', 'bdca']
    output = 4

    assert_equal output, Solution.longest_str_chain(words)
  end

  def test_2
    words = ['xbc', 'pcxbcf', 'xb', 'cxbc', 'pcxbc']
    output = 5

    assert_equal output, Solution.longest_str_chain(words)
  end

  def test_3
    words = ['abcd', 'dbqca']
    output = 1

    assert_equal output, Solution.longest_str_chain(words)
  end
end
