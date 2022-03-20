# frozen_string_literal: true

# https://leetcode.com/problems/longest-substring-without-repeating-characters/

require_relative '../test_helper'

# Runtime: 104 ms, faster than 92.69% of Ruby online submissions for Longest Substring Without Repeating Characters.
# Memory Usage: 243.5 MB, less than 5.00% of Ruby online submissions for Longest Substring Without Repeating Characters.
class Solution
  class << self
    def length_of_longest_substring(s)
      return s.size if s.size <= 1

      chars = []
      max_length = 0

      s.chars.each do |char|
        if chars.include?(char)
          start = chars.index(char) + 1
          chars = chars[start..]
        end

        chars.append(char)
        max_length = [max_length, chars.size].max
      end

      max_length
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = 'abcabcbb'
    output = 3

    assert_equal output, Solution.length_of_longest_substring(s)
  end

  def test_2
    s = 'bbbbb'
    output = 1

    assert_equal output, Solution.length_of_longest_substring(s)
  end

  def test_3
    s = 'pwwkew'
    output = 3

    assert_equal output, Solution.length_of_longest_substring(s)
  end

  def test_4
    s = ' '
    output = 1

    assert_equal output, Solution.length_of_longest_substring(s)
  end

  def test_5
    s = 'au'
    output = 2

    assert_equal output, Solution.length_of_longest_substring(s)
  end
end
