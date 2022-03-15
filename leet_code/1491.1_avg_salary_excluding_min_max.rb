# frozen_string_literal: true

# https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary/

require_relative '../test_helper'

# Runtime: 77 ms, faster than 86.21% of Ruby online submissions for Average Salary Excluding the Minimum and Maximum Salary.
# Memory Usage: 211.1 MB, less than 58.62% of Ruby online submissions for Average Salary Excluding the Minimum and Maximum Salary.
class Solution
  class << self
    def average(salary)
      min = salary[0]
      max = salary[0]
      sum = salary[0]

      salary[1..].each do |num|
        min = num if num < min
        max = num if num > max

        sum += num
      end

      (sum - max - min) / (salary.size - 2).to_f
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    salary = [4000, 3000, 1000, 2000]
    output = 2500

    assert_equal output, Solution.average(salary)
  end

  def test_2
    salary = [1000, 2000, 3000]
    output = 2000

    assert_equal output, Solution.average(salary)
  end
end
