# frozen_string_literal: true

# https://leetcode.com/problems/reverse-words-in-a-string-iii/

require 'minitest/autorun'

# Runtime: 140 ms, faster than 59.74% of Ruby online submissions for Reverse Words in a String III.
# Memory Usage: 211.7 MB, less than 77.92% of Ruby online submissions for Reverse Words in a String III.
class Solution
  class << self
    def reverse_words(s)
      left = 0
      chars = s.chars

      chars.each_with_index do |char, right|
        next unless char == ' '

        reverse(chars, left, right - 1)
        left = right + 1
      end

      reverse(chars, left, chars.size - 1)

      chars.join
    end

    def reverse(chars, left, right)
      while left < right
        chars[left], chars[right] = chars[right], chars[left]

        left += 1
        right -= 1
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = "Let's take LeetCode contest"
    output = "s'teL ekat edoCteeL tsetnoc"

    assert_equal output, Solution.reverse_words(s)
  end

  def test_2
    s = 'God Ding'
    output = 'doG gniD'

    assert_equal output, Solution.reverse_words(s)
  end
end
