# frozen_string_literal: true

# This question is asked by Google.
# Given a string only containing the following characters (, ), {, }, [, and ]
# return whether or not the opening and closing characters are in a valid order.
#
# "(){}[]", return true
# "(({[]}))", return true
# "{(})", return false

require_relative '../test_helper'

class Brackets
  PARENTHESIS = { ')' => '(', ']' => '[', '}' => '{' }.freeze

  def initialize(input)
    @input = input
    @stack = []
  end

  def valid?

    input.chars do |char|
      if opening_parenthesis.include?(char)
        stack.append(char)
      elsif invalid_input?(char)
        return false
      end
    end

    stack.size.zero?
  end

  private

  attr_reader :input, :stack

  def opening_parenthesis
    @opening_parenthesis ||= PARENTHESIS.values
  end

  def closing_parenthesis
    @closing_parenthesis ||= PARENTHESIS.keys
  end

  def invalid_input?(char)
    return true if stack.size.zero?

    closing_parenthesis.include?(char) && PARENTHESIS[char] != stack.pop
  end
end

class TestBrackets < Minitest::Test
  def test_1
    assert_equal true, Brackets.new('(){}[]').valid?
  end

  def test_2
    assert_equal true, Brackets.new('(({[]}))').valid?
  end

  def test_3
    assert_equal false, Brackets.new('{(})').valid?
  end
end
