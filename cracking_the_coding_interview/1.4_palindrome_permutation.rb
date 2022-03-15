# frozen_string_literal: true

# Given a string, write a function to check if it is a permutation of a palin­drome.
# A palindrome is a word or phrase that is the same forwards and backwards.
# A permutation is a rearrangement of letters.
# The palindrome does not need to be limited to just dictionary words.
#
# EXAMPLE
# Input: Tact Coa
# Output: True (permutations: "taco cat", "atco eta", etc.)

require_relative '../test_helper'

class PalindromePermutation
  def initialize(text)
    @text = text
    @checked_chars = Hash.new(0)
    @odd_chars_count = 0
  end

  def check?
    sanitised_text.each_char do |char|
      count_chars(char)
      count_odd_chars(char)
    end

    odd_chars_count <= 1
  end

  private

  attr_reader :text, :checked_chars, :odd_chars_count

  def sanitised_text
    text.delete(' ').downcase
  end

  def count_chars(char)
    checked_chars[char] += 1
  end

  def count_odd_chars(char)
    checked_chars[char].odd? ? @odd_chars_count += 1 : @odd_chars_count -= 1
  end
end

class TestPalindromePermutation < Minitest::Test
  def test_1
    assert_equal true, PalindromePermutation.new('Tact Coa').check?
  end

  def test_2
    assert_equal false, PalindromePermutation.new('Tatt Coa').check?
  end
end
