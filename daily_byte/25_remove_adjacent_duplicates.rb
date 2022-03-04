# frozen_string_literal: true

# This question is asked by Facebook.

# Given a string s containing only lowercase letters,
# continuously remove adjacent characters that are the same and return the result.

# Ex: Given the following strings...
# s = "abccba", return ""
# s = "foobar", return "fbar"
# s = "abccbefggfe", return "a"

require 'minitest/autorun'

class AdjacentCharacters
  def initialize(input)
    @input = input
  end

  def remove
    results = character_occurrances

    input_chars.keep_if { |char| results[char] == 1 }.join
  end

  private

  attr_reader :input

  def input_chars
    @input_chars ||= input.chars
  end

  def character_occurrances
    input_chars.each_with_object(Hash.new(0)) do |char, cache|
      cache[char] += 1
    end
  end
end

class TestAdjacentCharacters < Minitest::Test
  def test_1
    assert_equal '', AdjacentCharacters.new('abccba').remove
  end

  def test_2
    assert_equal 'fbar', AdjacentCharacters.new('foobar').remove
  end

  def test_3
    assert_equal 'a', AdjacentCharacters.new('abccbefggfe').remove
  end
end
