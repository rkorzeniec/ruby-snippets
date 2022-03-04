# frozen_string_literal: true

# This question is asked by Amazon.

# Given two arrays of numbers, where the first array is a subset of the second array,
# return an array containing all the next greater elements for each element in the first array,
# in the second array. If there is no greater element for any element,
# output -1 for that number.

# Ex: Given the following arrays…
# nums1 = [4, 1, 2], nums2 = [1, 3, 4, 2], return [-1, 3, -1]
# because no element in nums2 is greater than 4, 3 is the first number in nums2 greater than 1,
# and no element in nums2 is greater than 2.

# nums1 = [2, 4], nums2 = [1, 2, 3, 4], return [3, -1]
# because 3 is the first greater element that occurs in nums2 after 2 and
# no element is greater than 4.

require 'minitest/autorun'

class GreaterElements
  def initialize(nums1, nums2)
    @nums1 = nums1
    @nums2 = nums2
  end

  def find
    results = build_results_cache

    find_greater_elements(results)
  end

  private

  attr_reader :nums1, :nums2

  def build_results_cache
    stack = []
    results = {}

    nums2.each do |num|
      results[stack.pop] = num while !stack.empty? && num > stack.last

      stack.append(num)
    end

    results
  end

  def find_greater_elements(results)
    nums1.map do |num|
      results.key?(num) ? results[num] : -1
    end
  end
end

class TestGreaterElements < Minitest::Test
  def test_1
    assert_equal [-1, 3, -1], GreaterElements.new([4, 1, 2], [1, 3, 4, 2]).find
  end

  def test_2
    assert_equal [3, -1], GreaterElements.new([2, 4], [1, 2, 3, 4]).find
  end
end
