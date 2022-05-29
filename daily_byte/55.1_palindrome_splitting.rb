# frozen_string_literal: true

# This question is asked by Google.
# Given a string s,
# return all possible partitions of s such that each substring is a palindrome.

# Ex: Given the following string s…
# s = "abcba",

# return [
#     ["a","b","c","b","a"],
#     ["a","bcb","a"],
#     ["abcba"]
# ]

require_relative '../test_helper'

class Solution
  def palindrome_splitting(str)
    @result = []

    backtrack(str)
    @result
  end

  def backtrack(str, combination: [])
    return @result.append(combination.dup) if str.size.zero?

    (1..str.size).each do |i|
      next unless str[0...i] == str[0...i].reverse

      combination.append(str[0...i])
      backtrack(str[i..], combination:)
      combination.pop
    end
  end
end

class Test < Minitest::Test
  def test_1
    str = 'abcba'
    output = [%w[a b c b a], %w[a bcb a], %w[abcba]]

    assert_equal output, Solution.new.palindrome_splitting(str)
  end
end
