# frozen_string_literal: true

# This question is asked by Google.

# You are given a bag of coins, an initial energy of E,
# and want to maximize your number of points (which starts at zero).

# To gain a single point you can exchange coins[i] amount of energy
# (i.e. if I have 100 energy
# and a coin that has a value 50 I can exchange 50 energy to gain a point).

# If you do not have enough energy you can give away a point in exchange
# for an increase in energy by coins[i] amount
# (i.e. you give away a point and your energy is increased by the value of that
# coin: energy += coins[i]).

# Return the maximum number of points you can gain.

# NOTE: Each coin may only be used once.

# Ex: Given the following coins and starting energy…
# coins = [100, 150, 200] and E = 150, return 1
# coins = [100,200,300,400] and E = 200, return 2
# coins = [300] and E = 200, return 0

require_relative '../test_helper'

class Solution
  def max_points(coins, energy)
    points = 0
    answer = 0

    left = 0
    right = coins.size - 1

    while left <= right
      if energy >= coins[left]
        points += 1
        energy -= coins[left]
        left += 1
      elsif points.positive?
        points -= 1
        energy += coins[right]
        right -= 1
      else
        break
      end

      answer = [answer, points].max
    end

    answer
  end
end

class Test < Minitest::Test
  def test_1
    coins = [100, 150, 200]
    energy = 150
    output = 1

    assert_equal output, Solution.new.max_points(coins, energy)
  end

  def test_2
    coins = [100, 200, 300, 400]
    energy = 200
    output = 2

    assert_equal output, Solution.new.max_points(coins, energy)
  end

  def test_3
    coins = [300]
    energy = 200
    output = 0

    assert_equal output, Solution.new.max_points(coins, energy)
  end
end
