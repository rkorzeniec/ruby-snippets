# frozen_string_literal: true

# https://leetcode.com/problems/group-anagrams/

require_relative '../test_helper'

# Runtime: 227 ms, faster than 67.62% of Ruby online submissions for Group Anagrams.
# Memory Usage: 214.4 MB, less than 84.29% of Ruby online submissions for Group Anagrams.
class Solution
  class << self
    def group_anagrams(strs)
      return [strs] if strs.size <= 1

      checked_strings = {}

      strs.each do |str|
        sorted = str.chars.sort.join

        if checked_strings.key?(sorted)
          checked_strings[sorted].append(str)
        else
          checked_strings[sorted] = [str]
        end
      end

      checked_strings.values
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
