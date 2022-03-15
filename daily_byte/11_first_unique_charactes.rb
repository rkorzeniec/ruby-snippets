# frozen_string_literal: true

# This question is asked by Microsoft.
# Given a string, return the index of its first unique character.
# If a unique character does not exist, return -1.

require_relative '../test_helper'

class UniqueCharacter
  def initialize(text)
    @text = text
    @checked_chars = {}
  end

  def first
    text.chars.each_with_index do |char, index|
      if checked_chars.key?(char)
        checked_chars.delete(char)
      else
        checked_chars[char] = index
      end
    end

    checked_chars.empty? ? -1 : checked_chars.values.min
  end

  private

  attr_reader :text, :checked_chars
end

class TestUniqueCharacter < Minitest::Test
  def test_1
    assert_equal 2, UniqueCharacter.new('abcabd').first
  end

  def test_2
    assert_equal 1, UniqueCharacter.new('thedailybyte').first
  end

  def test_3
    assert_equal 0, UniqueCharacter.new('developer').first
  end

  def test_4
    assert_equal(-1, UniqueCharacter.new('aa').first)
  end

  def test_5
    text = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxy'
    assert_equal 25, UniqueCharacter.new(text).first
  end
end
