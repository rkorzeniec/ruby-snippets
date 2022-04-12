# frozen_string_literal: true

# https://leetcode.com/problems/valid-palindrome/

require_relative '../test_helper'

# Runtime: 137 ms, faster than 69.29% of Ruby online submissions for Valid Palindrome.
# Memory Usage: 212.4 MB, less than 73.41% of Ruby online submissions for Valid Palindrome.
class Solution
  class << self
    def is_palindrome(s)
      str = s.gsub(/[^a-zA-Z0-9]/, '').downcase

      left = 0
      right = str.size - 1

      while left < right
        return false if str[left] != str[right]

        left += 1
        right -= 1
      end

      true
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = ' '
    output = true

    assert_equal output, Solution.is_palindrome(s)
  end

  def test_2
    s = 'A man, a plan, a canal: Panama'
    output = true

    assert_equal output, Solution.is_palindrome(s)
  end

  def test_3
    s = 'race a car'
    output = false

    assert_equal output, Solution.is_palindrome(s)
  end

  def test_4
    s = '0P'
    output = false

    assert_equal output, Solution.is_palindrome(s)
  end
end
