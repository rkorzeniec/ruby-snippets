# frozen_string_literal: true

# https://leetcode.com/problems/valid-parentheses/

require_relative '../test_helper'

# Runtime: 96 ms, faster than 72.73% of Ruby online submissions for Valid Parentheses.
# Memory Usage: 211.1 MB, less than 58.81% of Ruby online submissions for Valid Parentheses.
class Solution
  class << self
    def is_valid(s)
      parenthesis = { ')' => '(', ']' => '[', '}' => '{' }.freeze
      stack = []

      s.chars.each do |char|
        if parenthesis.value?(char)
          stack.append(char)
        elsif stack.size.zero? || (parenthesis.key?(char) && parenthesis[char] != stack.pop)
          return false
        end
      end

      stack.empty?
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = '()'
    output = true

    assert_equal output, Solution.is_valid(s)
  end

  def test_2
    s = '()[]{}'
    output = true

    assert_equal output, Solution.is_valid(s)
  end

  def test_3
    s = '(]'
    output = false

    assert_equal output, Solution.is_valid(s)
  end
end
