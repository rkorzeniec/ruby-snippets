# frozen_string_literal: true

# https://leetcode.com/problems/pascals-triangle/

require 'minitest/autorun'

# Runtime: 72 ms, faster than 79.45% of Ruby online submissions for Pascal's Triangle.
# Memory Usage: 211.3 MB, less than 8.90% of Ruby online submissions for Pascal's Triangle.
class Solution
  class << self
    def generate(num_rows)
      result = []

      num_rows.times do |level|
        result.append([])

        (level + 1).times do |cell|
          if cell == 0 || cell == level
            result[level].append(1)
            next
          end

          value = result[level-1][cell - 1] + result[level-1][cell]
          result[level].append(value)
        end
      end

      result
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]], Solution.generate(5)
  end

  def test_2
    assert_equal [[1]], Solution.generate(1)
  end
end
