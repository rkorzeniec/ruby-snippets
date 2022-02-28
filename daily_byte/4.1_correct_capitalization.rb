# frozen_string_literal: true

# This question is asked by Google.

# Given a string, return whether or not it uses capitalization correctly.
# A string correctly uses capitalization if all letters are capitalized,
# no letters are capitalized, or only the first letter is capitalized.

require 'minitest/autorun'

class Capitalizer
  def initialize(text)
    @text = text
  end

  def correct?
    return true if text == text.upcase
    return true if text == text.downcase
    return true if text.start_with?(/[A-Z]/) && text[1..] == text[1..].downcase

    false
  end

  private

  attr_reader :text
end

class TestCapitalizer < Minitest::Test
  def test_1
    assert_equal true, Capitalizer.new('USA').correct?
  end

  def test_2
    assert_equal true, Capitalizer.new('Calvin').correct?
  end

  def test_3
    assert_equal false, Capitalizer.new('compUter').correct?
  end

  def test_4
    assert_equal true, Capitalizer.new('coding').correct?
  end

  def test_5
    assert_equal false, Capitalizer.new('SoftWare').correct?
  end
end
