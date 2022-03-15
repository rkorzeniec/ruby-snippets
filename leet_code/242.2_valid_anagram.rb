# frozen_string_literal: true

# https://leetcode.com/problems/valid-anagram/

require_relative '../test_helper'

# Runtime: 116 ms, faster than 89.61% of Ruby online submissions for Valid Anagram.
# Memory Usage: 217.3 MB, less than 37.28% of Ruby online submissions for Valid Anagram.
class Solution
  class << self
    def is_anagram(s, t)
      return false if s.size != t.size

      cache = {}

      s.chars.each do |char|
        cache.key?(char) ? cache[char] += 1 : cache[char] = 1
      end

      t.chars.each do |char|
        return false unless cache.key?(char)

        cache[char] -= 1
      end

      cache.each do |_, v|
        return false if v != 0
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
