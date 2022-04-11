# frozen_string_literal: true

# https://leetcode.com/problems/minimum-window-substring/

require_relative '../test_helper'

# Runtime: 201 ms, faster than 93.94% of Ruby online submissions for Minimum Window Substring.
# Memory Usage: 212.4 MB, less than 54.55% of Ruby online submissions for Minimum Window Substring.
class Solution
  class << self
    def min_window(s, t)
      return '' if s == '' || t == ''

      t_chars = Hash.new(0)
      t.chars.each { |char| t_chars[char] += 1 }
      unique_t_chars = t_chars.size

      left = 0
      right = 0
      window_unique_chars = 0
      window_chars = Hash.new(0)
      window = [Float::INFINITY, nil, nil]

      while right < s.size
        char = s[right]

        window_chars[char] += 1

        window_unique_chars += 1 if t_chars.key?(char) && t_chars[char] == window_chars[char]

        while left <= right && window_unique_chars == unique_t_chars
          char = s[left]

          window = [right - left + 1, left, right] if right - left + 1 < window[0]

          window_chars[char] -= 1
          window_unique_chars -= 1 if t_chars.key?(char) && window_chars[char] < t_chars[char]

          left += 1
        end

        right += 1
      end

      window[0] == Float::INFINITY ? '' : s[window[1]..window[2]]
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = 'ADOBECODEBANC'
    t = 'ABC'
    output = 'BANC'

    assert_equal output, Solution.min_window(s, t)
  end

  def test_2
    s = 'a'
    t = 'a'
    output = 'a'

    assert_equal output, Solution.min_window(s, t)
  end

  def test_3
    s = 'a'
    t = 'aa'
    output = ''

    assert_equal output, Solution.min_window(s, t)
  end
end
