# frozen_string_literal: true

# https://leetcode.com/problems/reverse-string/

require 'minitest/autorun'

# Runtime: 322 ms, faster than 58.16% of Ruby online submissions for Reverse String.
# Memory Usage: 225.6 MB, less than 62.58% of Ruby online submissions for Reverse String.
class Solution
  class << self
    def reverse_string(s)
      left = 0
      right = s.length - 1

      while left < right
        s[left], s[right] = s[right], s[left]

        left += 1
        right -= 1
      end

      s
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    s = %w[h e l l o]
    output = %w[o l l e h]

    assert_equal output, Solution.reverse_string(s)
  end

  def test_2
    s = %w[H a n n a h]
    output = %w[h a n n a H]

    assert_equal output, Solution.reverse_string(s)
  end
end
