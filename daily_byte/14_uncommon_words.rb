# frozen_string_literal: true

# This question is asked by Amazon.
#
# Given two strings representing sentences, return the words that are not common
# to both strings (i.e. the words that only appear in one of the sentences).
#
# You may assume that each sentence is a sequence of words
# (without punctuation) correctly separated using space characters.

require 'minitest/autorun'
require 'set'

class UncommonWords
  def initialize(sentence, other_sentence)
    @sentence = sentence
    @other_sentence = other_sentence
  end

  def find
    (sentence_words - other_sentence_words) + (other_sentence_words - sentence_words)
  end

  private

  attr_reader :sentence, :other_sentence

  def sentence_words
    @sentence_words ||= sentence.split
  end

  def other_sentence_words
    @other_sentence_words ||= other_sentence.split
  end
end

class TestUncommonWords < Minitest::Test
  def test_1
    assert_equal %w[the quick brown fox], UncommonWords.new('the quick', 'brown fox').find
  end

  def test_2
    assert_equal %w[beat lost to], UncommonWords.new(
      'the tortoise beat the haire',
      'the tortoise lost to the haire'
    ).find
  end

  def test_3
    assert_equal %w[copper hot], UncommonWords.new('copper coffee pot', 'hot coffee pot').find
  end
end
