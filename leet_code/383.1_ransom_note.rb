# frozen_string_literal: true

# https://leetcode.com/problems/ransom-note/

require_relative '../test_helper'

# Runtime: 145 ms, faster than 84.00% of Ruby online submissions for Ransom Note.
# Memory Usage: 263.5 MB, less than 5.33% of Ruby online submissions for Ransom Note.
class Solution
  class << self
    def can_construct(ransom_note, magazine)
      ransom_note.chars.each do |char|
        return false unless magazine.include?(char)

        magazine = magazine.sub(char, '')
      end

      true
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    ransom_note = 'a'
    magazine = 'b'

    assert_equal false, Solution.can_construct(ransom_note, magazine)
  end

  def test_2
    ransom_note = 'aa'
    magazine = 'ab'

    assert_equal false, Solution.can_construct(ransom_note, magazine)
  end

  def test_3
    ransom_note = 'aa'
    magazine = 'aab'

    assert_equal true, Solution.can_construct(ransom_note, magazine)
  end
end
