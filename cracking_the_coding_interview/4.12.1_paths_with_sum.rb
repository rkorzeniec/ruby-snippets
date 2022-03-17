# frozen_string_literal: true

# You are given a binary tree in which each node contains an integer value
# (which might be positive or negative).

# Design an algorithm to count the number of paths that sum to a given value.
# The path does not need to start or end at the root or a leaf,
# but it must go downwards (traveling only from parent nodes to child nodes).

require_relative '../test_helper'

class TreeNode
  attr_accessor :value, :left, :right, :size

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
    @size = 1
  end

  def insert(data)
    if data <= value
      if left.nil?
        @left = TreeNode.new(value: data)
      else
        left.insert(data)
      end
    elsif right.nil?
      @right = TreeNode.new(value: data)
    else
      right.insert(data)
    end

    @size += 1
  end

  def paths_with_sum(node: root, target_sum:, running_sum: 0, cache: Hash.new(0))
    return 0 if node.nil?

    running_sum += node.value
    sum = running_sum - target_sum
    paths = cache[sum] || 0

    paths += 1 if running_sum == target_sum

    cache[running_sum] += 1
    paths += paths_with_sum(node: node.left, target_sum:, running_sum:, cache:)
    paths += paths_with_sum(node: node.right, target_sum:, running_sum:, cache:)
    cache[running_sum] -= 1

    paths
  end
end
