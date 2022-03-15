# frozen_string_literal: true

require_relative '../test_helper'

class Reverser
  def initialize(text)
    @text = text
  end

  def call
    text.reverse
  end

  private

  attr_reader :text
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
