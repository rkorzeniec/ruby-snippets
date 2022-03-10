# frozen_string_literal: true

# https://leetcode.com/problems/valid-anagram/

require 'minitest/autorun'

# Runtime: 404 ms, faster than 5.02% of Ruby online submissions for Valid Anagram.
# Memory Usage: 306.3 MB, less than 5.73% of Ruby online submissions for Valid Anagram.
class Solution
  class << self
    def is_anagram(s, t)
      return false if s.size != t.size

      t.chars.each do |char|
        return false unless s.include?(char)

        s = s.sub(char, '')
      end

      true
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = 'anagram'
    t = 'nagaram'
    output = true

    assert_equal output, Solution.is_anagram(s, t)
  end

  def test_2
    s = 'rat'
    t = 'car'
    output = false

    assert_equal output, Solution.is_anagram(s, t)
  end
end
