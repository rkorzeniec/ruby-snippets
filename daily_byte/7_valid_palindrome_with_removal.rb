# frozen_string_literal: true

# This question is asked by Facebook.
# Given a string and the ability to delete at most one character,
# return whether or not it can form a palindrome.

# NOTE: a palindrome is a sequence of characters that reads the same forwards and backwards.

require 'minitest/autorun'

class Palindrome
  def initialize(text)
    @text = text
  end

  def valid?
    removed = false

    front = 0
    back = text.length - 1

    while front < back
      if text[front] != text[back]
        return false if removed

        removed = true
      end

      front += 1
      back -= 1
    end

    true
  end

  private

  attr_reader :text
end

class TestPalindrome < Minitest::Test
  def test_1
    assert_equal true, Palindrome.new('abcba').valid?
  end

  def test_2
    assert_equal true, Palindrome.new('foobof').valid?
  end

  def test_3
    assert_equal false, Palindrome.new('abccab').valid?
  end
end
