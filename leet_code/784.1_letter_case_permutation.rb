# frozen_string_literal: true

# https://leetcode.com/problems/letter-case-permutation/

require_relative '../test_helper'

# Runtime: 152 ms, faster than 78.43% of Ruby online submissions for Letter Case Permutation.
# Memory Usage: 212.7 MB, less than 76.47% of Ruby online submissions for Letter Case Permutation.
class Solution
  class << self
    def letter_case_permutation(s)
      @result = []

      backtrack(s, '')

      @result
    end

    def backtrack(s, combination)
      return @result.append(combination.dup) if s.empty?

      backtrack(s[1..], combination + s[0].upcase) if ('a'..'z').cover?(s[0].downcase)
      backtrack(s[1..], combination + s[0].downcase)
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = 'a1b2'
    output = %w[A1B2 A1b2 a1B2 a1b2]

    assert_equal output, Solution.letter_case_permutation(s)
  end

  def test_2
    s = '3z4'
    output = %w[3Z4 3z4]

    assert_equal output, Solution.letter_case_permutation(s)
  end

  def test_3
    s = 'C'
    output = %w[C c]

    assert_equal output, Solution.letter_case_permutation(s)
  end
end
