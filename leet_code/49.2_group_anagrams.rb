# frozen_string_literal: true

# https://leetcode.com/problems/group-anagrams/

require_relative '../test_helper'

# Runtime: 164 ms, faster than 93.81% of Ruby online submissions for Group Anagrams.
# Memory Usage: 220.2 MB, less than 27.62% of Ruby online submissions for Group Anagrams.
class Solution
  class << self
    def group_anagrams(strs)
      strs.group_by { |str| str.chars.sort }.values
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    strs = ['eat', 'tea', 'tan', 'ate', 'nat', 'bat']
    output = [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']]

    assert_equal output, Solution.group_anagrams(strs)
  end

  def test_2
    strs = ['']
    output = [['']]

    assert_equal output, Solution.group_anagrams(strs)
  end

  def test_3
    strs = ['a']
    output = [['a']]

    assert_equal output, Solution.group_anagrams(strs)
  end
end
