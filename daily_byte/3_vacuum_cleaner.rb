# frozen_string_literal: true

# This question is asked by Amazon.

# Given a string representing the sequence of moves a robot vacuum makes,
# return whether or not it will return to its original position.
# The string will only contain L, R, U, and D characters, representing
# left, right, up, and down respectively.

# Ex: Given the following strings...
#     "LR", return true
#     "URURD", return false
#     "RUULLDRD", return true

require 'minitest/autorun'

Point = Struct.new(:x, :y, keyword_init: true)

class VacuumCleanerRoute
  def initialize(route)
    @route = route.chars
    @coordinates = Point.new(x: 0, y: 0)
  end

  def returned?
    route.each do |action|
      move_up if action == 'U'
      move_right if action == 'R'
      move_down if action == 'D'
      move_left if action == 'L'
    end

    coordinates.x.zero? && coordinates.y.zero?
  end

  private

  attr_reader :route, :coordinates

  def move_up
    coordinates.y += 1
  end

  def move_right
    coordinates.x += 1
  end

  def move_down
    coordinates.y -= 1
  end

  def move_left
    coordinates.x -= 1
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal true, VacuumCleanerRoute.new('LR').returned?
  end

  def test_2
    assert_equal false, VacuumCleanerRoute.new('URURD').returned?
  end

  def test_3
    assert_equal true, VacuumCleanerRoute.new('RUULLDRD').returned?
  end
end
