# frozen_string_literal: true

# There are three types of edits that can be performed on strings:
# insert a character, remove a character, or replace a character.
# Given two strings, write a function to check if they are one edit (or zero edits) away.

#
# EXAMPLE
# pale, ple -> true
# pales, pale -> true
# pale, bale -> true
# pale, bake -> false

require_relative '../test_helper'

class OneAway
  def initialize(text, other_text)
    @text = text
    @other_text = other_text
  end

  def check?
    return check_replaced? if same_length_texts?
    return check_inserted? if text.length - 1 == other_text.length
    return check_removed? if text.length + 1 == other_text.length

    false
  end

  private

  attr_reader :text, :other_text

  def same_length_texts?
    text.length == other_text.length
  end

  def check_replaced?
    replaced = false

    text.chars.each_with_index do |char, index|
      next if char == other_text[index]
      return false if replaced

      replaced = true
    end

    true
  end

  def check_inserted?
    check_edited?(text, other_text)
  end

  def check_removed?
    check_edited?(other_text, text)
  end

  def check_edited?(text1, text2)
    index1 = 0
    index2 = 0

    while index1 < text1.length && index2 < text2.length
      if text1[index1] == text2[index2]
        return false if index1 != index2
      else
        index1 += 1
      end

      index2 += 1
    end

    true
  end
end

class TestOneAway < Minitest::Test
  def test_1
    assert_equal true, OneAway.new('pale', 'ple').check?
  end

  def test_2
    assert_equal true, OneAway.new('pales', 'pale').check?
  end

  def test_3
    assert_equal true, OneAway.new('pale', 'bale').check?
  end

  def test_4
    assert_equal false, OneAway.new('pale', 'bake').check?
  end

  def test_5
    assert_equal false, OneAway.new('pale', 'paless').check?
  end

  def test_6
    assert_equal false, OneAway.new('pale', 'pa').check?
  end
end
