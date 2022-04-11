# frozen_string_literal: true

# https://leetcode.com/problems/decode-ways/

require_relative '../test_helper'

# Runtime: 92 ms, faster than 74.29% of Ruby online submissions for Decode Ways.
# Memory Usage: 211 MB, less than 81.43% of Ruby online submissions for Decode Ways.
class Solution
  class << self
    def num_decodings(s)
      return 0 if s.size.zero?
      return 0 if s[0] == '0'

      cache = [0] * (s.size + 1)
      cache[0] = 1
      cache[1] = s[0] == '0' ? 0 : 1

      (2...cache.size).each do |i|
        cache[i] += cache[i - 1] if s[i - 1...i].to_i >= 1 && s[i - 1...i].to_i <= 9
        cache[i] += cache[i - 2] if s[i - 2...i].to_i >= 10 && s[i - 2...i].to_i <= 26
      end

      cache[-1]
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = '12'
    output = 2

    assert_equal output, Solution.num_decodings(s)
  end

  def test_2
    s = '226'
    output = 3

    assert_equal output, Solution.num_decodings(s)
  end

  def test_3
    s = '06'
    output = 0

    assert_equal output, Solution.num_decodings(s)
  end

  def test_4
    s = '10'
    output = 1

    assert_equal output, Solution.num_decodings(s)
  end
end
