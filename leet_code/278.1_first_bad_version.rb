# frozen_string_literal: true

# https://leetcode.com/problems/first-bad-version/

require_relative '../test_helper'

# Runtime: 80 ms, faster than 66.99% of Ruby online submissions for First Bad Version.
# Memory Usage: 210.7 MB, less than 44.74% of Ruby online submissions for First Bad Version.
class Solution
  class << self
    def first_bad_version(n)
      low = 1

      while low < n
        mid = low + (n - low) / 2

        if is_bad_version(mid)
          n = mid
        else
          low = mid + 1
        end
      end

      low
    end
  end
end
