# frozen_string_literal: true

# This question is asked by Amazon.

# Given a string s consisting of only letters and digits,
# where we are allowed to transform any letter to uppercase or lowercase,
# return a list containing all possible permutations of the string.

# Ex: Given the following string…
# S = "c7w2", return ["c7w2", "c7W2", "C7w2", "C7W2"]

require_relative '../test_helper'

class Solution
  def permutations(s, combination: '', result: [])
    return result.append(combination.dup) if s.size.zero?

    permutations(s[1..], combination: combination + s[0].downcase, result:)

    if ('a'..'z').cover?(s[0].downcase)
      permutations(s[1..], combination: combination + s[0].upcase, result:)
    end

    result
  end
end

class Test < Minitest::Test
  def test_1
    s = 'c7w2'
    output = %w[c7w2 c7W2 C7w2 C7W2]

    assert_equal output, Solution.new.permutations(s)
  end
end
