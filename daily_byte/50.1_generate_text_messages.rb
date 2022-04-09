# frozen_string_literal: true

# This question is asked by Google.

# Given a string of digits,
# return all possible text messages those digits could send.

# NOTE: The mapping of digits to letters is as follows…
# 0 -> null
# 1 -> null
# 2 -> "abc"
# 3 -> "def"
# 4 -> "ghi"
# 5 -> "jkl"
# 6 -> "mno"
# 7 -> "pqrs"
# 8 -> "tuv"
# 9 -> "wxyz"
# Ex: digits = "23" return ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]

require_relative '../test_helper'

class Solution
  MAPPING = {
    '0' => nil,
    '1' => nil,
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }

  def messages(digits, combination: '', result: [])
    return result.append(combination.dup) if digits.size.zero?

    MAPPING[digits[0]].chars.each do |char|
      next if char.nil?

      messages(digits[1..], combination: combination + char, result:)
    end

    result
  end
end

class Test < Minitest::Test
  def test_1
    digits = '23'
    output = %w[ad ae af bd be bf cd ce cf]

    assert_equal output, Solution.new.messages(digits)
  end
end
