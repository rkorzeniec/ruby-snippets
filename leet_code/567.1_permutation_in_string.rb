# frozen_string_literal: true

# https://leetcode.com/problems/permutation-in-string/

require_relative '../test_helper'

# Runtime: 127 ms, faster than 88.70% of Ruby online submissions for Permutation in String.
# Memory Usage: 211.1 MB, less than 50.85% of Ruby online submissions for Permutation in String.
class Solution
  class << self
    def check_inclusion(s1, s2)
      return false if s1.size > s2.size

      s1_chars = Array.new(26, 0)
      s2_chars = Array.new(26, 0)

      s1.size.times do |i|
        s1_chars[s1[i].ord - 97] += 1 # 97 == 'a'.ord
        s2_chars[s2[i].ord - 97] += 1
      end

      (s2.size - s1.size).times do |i|
        return true if s1_chars == s2_chars

        s2_chars[s2[i + s1.size].ord - 97] += 1
        s2_chars[s2[i].ord - 97] -= 1
      end

      s1_chars == s2_chars
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s1 = 'ab'
    s2 = 'eidbaooo'
    output = true

    assert_equal output, Solution.check_inclusion(s1, s2)
  end

  def test_2
    s1 = 'ab'
    s2 = 'eidboaoo'
    output = false

    assert_equal output, Solution.check_inclusion(s1, s2)
  end

  def test_3
    s1 = 'adc'
    s2 = 'cdcda'
    output = true

    assert_equal output, Solution.check_inclusion(s1, s2)
  end
end
