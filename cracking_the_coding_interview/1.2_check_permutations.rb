# frozen_string_literal: true

# Given two strings, write a method to decide if one is a permutation of the other.

require_relative '../test_helper'
require 'set'

class Solution
  def permutation?(text, other_text)
    return false if text.length != other_text.length

    Set.new(text.chars).subset?(Set.new(other_text.chars))
  end
end

class Solution2
  def permutation?(text, other_text)
    additional_chars = ''
    left = 0
    right = other_text.length - 1

    while left < right
      additional_chars += other_text[left] unless text.include?(other_text[left])
      additional_chars += other_text[right] unless text.include?(other_text[right])

      left += 1
      right -= 1
    end

    additional_chars.empty?
  end
end

class TestSolution < Minitest::Test
  def setup
    @solution = Solution.new
    @solution2 = Solution2.new
  end

  def test_1
    assert_equal false, @solution.permutation?('foobar', 'barfoot')
    assert_equal false, @solution2.permutation?('foobar', 'barfoot')
  end

  def test_2
    assert_equal false, @solution.permutation?('ide', 'idea')
    assert_equal false, @solution2.permutation?('ide', 'idea')
  end

  def test_3
    assert_equal true, @solution.permutation?('coding', 'ingcod')
    assert_equal true, @solution2.permutation?('coding', 'ingcod')
  end
end
