# frozen_string_literal: true

# Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use additional data structures?

require_relative '../test_helper'
require 'set'

class Solution
  def initialize
    @chars = Set.new
  end

  def unique?(text)
    text.each_char do |char|
      return false if chars.include?(char)

      chars.add(char)
    end

    true
  end

  private

  attr_reader :chars
end

class Solution2
  def unique?(text)
    text_array = text.split('')
    Set.new(text_array).size == text_array.size
  end
end

class TestSolution < Minitest::Test
  def setup
    @solution = Solution.new
    @solution2 = Solution2.new
  end

  def test_1
    assert_equal true, @solution.unique?('abcd')
  end

  def test_2
    assert_equal true, @solution.unique?('a')
  end

  def test_3
    assert_equal false, @solution.unique?('abcdefghijklmnopqrstuvxyza')
  end

  def test_4
    assert_equal true, @solution2.unique?('abcd')
  end

  def test_5
    assert_equal true, @solution2.unique?('a')
  end

  def test_6
    assert_equal false, @solution2.unique?('abcdefghijklmnopqrstuvxyza')
  end
end
