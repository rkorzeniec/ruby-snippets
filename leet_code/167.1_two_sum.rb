# frozen_string_literal: true

# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

require 'minitest/autorun'

# Runtime: 98 ms, faster than 67.16% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
# Memory Usage: 212 MB, less than 21.64% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
class Solution
  class << self
    def two_sum(numbers, target)
      cache = {}

      numbers.size.times do |i|
        remaining = target - numbers[i]
        return [cache[remaining] + 1, i + 1] if cache.key?(remaining)

        cache[numbers[i]] = i
      end

      []
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    numbers = [2, 7, 11, 15]
    target = 9
    output = [1, 2]

    assert_equal output, Solution.two_sum(numbers, target)
  end

  def test_2
    numbers = [2, 3, 4]
    target = 6
    output = [1, 3]

    assert_equal output, Solution.two_sum(numbers, target)
  end

  def test_3
    numbers = [-1, 0]
    target = -1
    output = [1, 2]

    assert_equal output, Solution.two_sum(numbers, target)
  end
end
