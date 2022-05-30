# frozen_string_literal: true

# This question is asked by Amazon.

# A ship is about to set sail and you are responsible for its safety precautions.
# More specifically, you are responsible for determining how many life rafts to carry onboard.
# You are given a list of all the passengers’ weights and
# are informed that a single life raft has a maximum capacity of limit and
# can hold at most two people.

# Return the minimum number of life rafts you must take onboard to
# ensure the safety of all your passengers.

# NOTE: You may assume that a the maximum weight of any individual is at most limit.

# Ex: Given the following passenger weights and limit…
# weights = [1, 3, 5, 2] and limit = 5, return 3
# weights = [1, 2] and limit = 3, return 1
# weights = [4, 2, 3, 3] and limit = 5 return 3

require_relative '../test_helper'

class Solution
  def life_rafts(weights, limit)
    return 0 if weights.empty?

    weights.sort!
    calculate_rafts(weights, limit)
  end

  def calculate_rafts(weights, limit)
    rafts = 1
    raft_weights = [weights[0]]

    weights[1..].each do |weight|
      if max_capacity?(raft_weights) || over_limit?(raft_weights, weight, limit)
        rafts += 1
        raft_weights = [weight]
      else
        raft_weights << weight
      end
    end

    rafts
  end

  def max_capacity?(weights)
    weights.size == 2
  end

  def over_limit?(weights, weight, limit)
    weights.sum + weight > limit
  end
end

class Test < Minitest::Test
  def test_1
    weights = [1, 3, 5, 2]
    limit = 5
    output = 3

    assert_equal output, Solution.new.life_rafts(weights, limit)
  end

  def test_2
    weights = [1, 2]
    limit = 3
    output = 1

    assert_equal output, Solution.new.life_rafts(weights, limit)
  end

  def test_3
    weights = [4, 2, 3, 3]
    limit = 5
    output = 3

    assert_equal output, Solution.new.life_rafts(weights, limit)
  end
end
