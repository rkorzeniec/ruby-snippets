# frozen_string_literal: true

# https://leetcode.com/problems/first-unique-character-in-a-string/

require_relative '../test_helper'

# Runtime: 272 ms, faster than 86.36% of Ruby online submissions for First Unique Character in a String.
# Memory Usage: 219.8 MB, less than 5.05% of Ruby online submissions for First Unique Character in a String.
class Solution
  class << self
    def first_uniq_char(s)
      chars = {}

      s.chars.each_with_index do |char, index|
        if chars.key?(char)
          chars[char].append(index)
        else
          chars[char] = [index]
        end
      end

      chars.each do |_, v|
        return v[0] if v.size == 1
      end

      -1
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    assert_equal 0, Solution.first_uniq_char('leetcode')
  end

  def test_2
    assert_equal 2, Solution.first_uniq_char('loveleetcode')
  end

  def test_3
    assert_equal -1, Solution.first_uniq_char('aabb')
  end

  def test_4
    assert_equal -1, Solution.first_uniq_char('aadadaad')
  end
end
