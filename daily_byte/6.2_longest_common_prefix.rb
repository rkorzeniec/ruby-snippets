# frozen_string_literal: true

# This problem was recently asked by Microsoft.

# Given a list of strings, find the longest common prefix between all strings.

require_relative '../test_helper'

class LongestCommonPrefix
  def initialize(words)
    @words = words
    @result = ''
  end

  def call
    shortest_word.chars.each do |char|
      prefix = result + char
      break unless all_words_share_prefix?(prefix)

      @result = prefix
    end

    result
  end

  private

  attr_reader :words, :result

  def shortest_word
    words.min
  end

  def all_words_share_prefix?(prefix)
    words.all? { |word| word.start_with?(prefix) }
  end
end

class TestLongestCommonPrefix < Minitest::Test
  def test_1
    assert_equal 'col', LongestCommonPrefix.new(%w[colorado color cold]).call
  end

  def test_2
    assert_equal '', LongestCommonPrefix.new(%w[a b c]).call
  end

  def test_3
    assert_equal 'spot', LongestCommonPrefix.new(%w[spot spotty spotted]).call
  end
end
