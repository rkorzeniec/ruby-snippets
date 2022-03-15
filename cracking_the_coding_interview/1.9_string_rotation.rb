# frozen_string_literal: true

# Assume you have a method isSubstring which checks if one word is a substring of another.
#
# Given two strings,
# s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring
# (e.g., "waterbottle" is a rotation of "erbottlewat").

require_relative '../test_helper'

class StringRotate
  def initialize(text, other_text)
    @text = text
    @other_text = other_text
  end

  def ratation?
    text.each_char.with_index do |_, index|
      return true if test_text(index) == other_text
    end

    false
  end

  private

  attr_reader :text, :other_text

  def test_text(index)
    "#{text[index + 1..]}#{text[..index]}"
  end
end

class TestStringRotate < Minitest::Test
  def test_1
    assert_equal true, StringRotate.new('waterbottle', 'erbottlewat').ratation?
  end

  def test_2
    assert_equal false, StringRotate.new('waterbottle', 'bottlewat').ratation?
  end
end
