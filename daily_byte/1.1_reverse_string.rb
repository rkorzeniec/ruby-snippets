# frozen_string_literal: true

# IMPORTANT: normally I'd use String#reverse as it would be more performant,
# as it is written in C on the String class.

require_relative '../test_helper'

class Reverser
  def initialize(text)
    @text = text
  end

  def call
    reversed = ''

    text_length.downto(0) { |i| reversed += text[i] }

    reversed
  end

  private

  attr_reader :text

  def text_length
    text.length - 1
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal 'taC', Reverser.new('Cat').call
  end

  def test_2
    assert_equal 'etyB yliaD ehT', Reverser.new('The Daily Byte').call
  end

  def test_3
    assert_equal 'civic', Reverser.new('civic').call
  end
end
