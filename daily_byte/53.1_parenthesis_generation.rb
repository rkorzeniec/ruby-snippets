# frozen_string_literal: true

# This question is asked by Facebook.

# Given an integer N, where N represents the number of pairs of parentheses
# (i.e. ”(“ and ”)”) you are given,
# return a list containing all possible well-formed parentheses you can create.

# Ex: Given the following value of N…
# N = 3,

# return [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

require_relative '../test_helper'

class Solution
  def generate_parenthesis(n)
    @result = []

    backtrack(n, open_count: 0, close_count: 0) if n.positive?

    @result
  end

  def backtrack(n, combination: '', open_count: 0, close_count: 0)
    return @result.append(combination) if n == close_count

    if open_count > close_count
      backtrack(n, combination: "#{combination})", open_count:, close_count: close_count + 1)
    end

    return unless open_count < n

    backtrack(n, combination: "#{combination}(", open_count: open_count + 1, close_count:)
  end
end

class Test < Minitest::Test
  def test_1
    n = 3
    output = [
      '()()()',
      '()(())',
      '(())()',
      '(()())',
      '((()))'
    ]

    assert_equal output, Solution.new.generate_parenthesis(n)
  end
end
