# frozen_string_literal: true

# This question is asked by Amazon.
# Given two strings s and t, which represents a sequence of keystrokes,
# where # denotes a backspace,
# return whether or not the sequences produce the same result.
#
# Ex: Given the following strings...
#
# s = "ABC#", t = "CD##AB", return true
# s = "como#pur#ter", t = "computer", return true
# s = "cof#dim#ng", t = "code", return false

require_relative '../test_helper'

class Keystrokes
  BACKSPACE = '#'

  def initialize(s_input, t_input)
    @s_input = s_input
    @t_input = t_input
  end

  def compare
    s_stack = build_stack(s_input)
    t_stack = build_stack(t_input)

    s_stack == t_stack
  end

  private

  attr_reader :s_input, :t_input

  def build_stack(input)
    input.chars.each_with_object([]) do |char, stack|
      char == BACKSPACE ? stack.pop : stack.append(char)
    end
  end
end

class TestKeystrokes < Minitest::Test
  def test_1
    assert_equal true, Keystrokes.new('ABC#', 'CD##AB').compare
  end

  def test_2
    assert_equal true, Keystrokes.new('como#pur#ter', 'computer').compare
  end

  def test_3
    assert_equal false, Keystrokes.new('cof#dim#ng', 'code').compare
  end
end
