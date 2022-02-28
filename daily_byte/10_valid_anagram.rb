# frozen_string_literal: true

# This question is asked by Facebook.
# Given two strings s and t, return whether or not s is an anagram of t.
# Note: An anagram is a word formed by reordering the letters of another word.

require 'minitest/autorun'

class Anagram
  def initialize(text)
    @text = text
  end

  def valid?(other_text)
    return false if text.length != other_text.length

    other_text.chars.each do |char|
      index = text.index(char)

      return false if index.nil?

      @text = text.sub(char, '')
    end

    text.empty?
  end

  private

  attr_reader :text
end

class TestAnagram < Minitest::Test
  def test_1
    assert_equal true, Anagram.new('cat').valid?('tac')
  end

  def test_2
    assert_equal true, Anagram.new('listen').valid?('silent')
  end

  def test_3
    assert_equal false, Anagram.new('program').valid?('function')
  end

  def test_4
    assert_equal false, Anagram.new('caat').valid?('tac')
  end

  def test_5
    assert_equal false, Anagram.new('cat').valid?('taac')
  end
end
