# frozen_string_literal: true

# Write a method to replace all spaces in a string with '%20'.
# You may assume that the string has sufficient space at the end to hold
# the additional characters, and that you are given the "true" length of the string.
#
# EXAMPLE
# Input: "Mr John Smith ", 13
# Output: "Mr%20John%20Smith"

require 'minitest/autorun'

class Urlify
  def initialize(text)
    @text = text
  end

  def call
    text.strip.gsub(' ', '%20')
  end

  private

  attr_reader :text
end

class TestUrlify < Minitest::Test
  def test_1
    assert_equal 'Mr%20John%20Smith', Urlify.new('Mr John Smith          ').call
  end
end
