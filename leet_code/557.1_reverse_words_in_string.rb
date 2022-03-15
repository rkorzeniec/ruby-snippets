# frozen_string_literal: true

# https://leetcode.com/problems/reverse-words-in-a-string-iii/

require_relative '../test_helper'

# Runtime: 140 ms, faster than 59.74% of Ruby online submissions for Reverse Words in a String III.
# Memory Usage: 211.7 MB, less than 77.92% of Ruby online submissions for Reverse Words in a String III.
class Solution
  class << self
    def reverse_words(s)
      s.split.each do |word|
        left = 0
        right = word.length - 1

        while left < right
          word[left], word[right] = word[right], word[left]

          left += 1
          right -= 1
        end
      end.join(' ')
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
