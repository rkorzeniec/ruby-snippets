# frozen_string_literal: true

# Implement a method to perform basic string compression using the counts of
# repeated characters.
# For example, the string aabcccccaaa would become a2b1c5a3.
#
# If the "compressed" string would not become smaller than the original string,
# your method should return the original string. You can assume the string has
# only uppercase and lowercase letters(a - z).

require_relative '../test_helper'

class StringCompresser
  def initialize(text)
    @text = text
    @compressed_text = []
  end

  def call
    compress_text

    compressed? ? text : compressed_text.join
  end

  private

  attr_reader :text, :compressed_text

  def compress_text
    index = 0

    while index < text.length
      count = 1
      char = text[index]

      while index < text.length && char == text[index]
        count += 1
        index += 1
      end

      compressed_text.append(char, count - 1)
    end
  end

  def compressed?
    compressed_text.length >= text.length
  end
end

class TestStringCompresser < Minitest::Test
  def test_1
    assert_equal 'a2b1c5a3', StringCompresser.new('aabcccccaaa').call
  end

  def test_2
    assert_equal 'aabccaa', StringCompresser.new('aabccaa').call
  end

  def test_3
    assert_equal 'aabbccaa', StringCompresser.new('aabbccaa').call
  end
end
