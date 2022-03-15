# frozen_string_literal: true

# This question is asked by Facebook.
# Given a string, return whether or not it forms a palindrome ignoring case and
# non-alphabetical characters.

# NOTE: a palindrome is a sequence of characters that reads the same forwards
# and backwards.

require_relative '../test_helper'

class Palindrome
  def initialize(text)
    @text = sanitized_text(text)
  end

  def check?
    front = 0
    back = text_length

    while front < back
      return false unless text[front] == text[back]

      front += 1
      back -= 1
    end

    true
  end

  private

  attr_reader :text

  def sanitized_text(text)
    text.gsub(/[^a-zA-Z]/, '').downcase
  end

  def text_length
    text.length - 1
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal true, Palindrome.new('level').check?
  end

  def test_2
    assert_equal false, Palindrome.new('algorithm').check?
  end

  def test_3
    assert_equal true, Palindrome.new('A man, a plan, a canal: Panama.').check?
  end
end
