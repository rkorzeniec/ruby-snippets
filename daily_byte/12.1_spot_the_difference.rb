# frozen_string_literal: true

# This question is asked by Google.

# You are given two strings, s and t which only consist of lowercase letters.
# t is generated by shuffling the letters in s as well as potentially adding an
# additional random character.

# Return the letter that was randomly added to t if it exists, otherwise, return ’  ‘.

# NOTE: You may assume that at most one additional character can be added to t.

require 'minitest/autorun'

class RandomCharacter
  def initialize(text, other_text)
    @text = text
    @other_text = other_text
  end

  def find
    (other_text.chars - text.chars).join
  end

  private

  attr_reader :text, :other_text
end

class TestRandomCharacter < Minitest::Test
  def test_1
    assert_equal 't', RandomCharacter.new('foobar', 'barfoot').find
  end

  def test_2
    assert_equal 'a', RandomCharacter.new('ide', 'idea').find
  end

  def test_3
    assert_equal '', RandomCharacter.new('coding', 'ingcod').find
  end
end