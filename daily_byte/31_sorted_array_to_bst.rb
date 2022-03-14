# frozen_string_literal: true

# Given an array of numbers sorted in ascending order,
# return a height-balanced binary search tree using every number from the array.

# NOTE: height-balanced meaning that the level of any node’s two subtrees
# should not differ by more than one.

# Ex: Given the following nums...
# nums = [1, 2, 3] return a reference to the following tree...
#        2
#       /  \
#      1    3

# Ex: Given the following nums...
# nums = [1, 2, 3, 4, 5, 6] return a reference to the following tree...
#         3
#        / \
#       2   5
#      /   / \
#     1   4   6

require 'minitest/autorun'

class Node
  attr_accessor :value, :left, :right

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value:)
    return initialize_root(value) if root.nil?

    insert_node(value:, node: root)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def populate(nums)
    return if nums.empty?

    pivot = nums.size / 2

    insert(value: nums[pivot])
    populate(nums[0...pivot])
    populate(nums[pivot + 1..])

    true
  end

  private

  def initialize_root(value)
    @root = Node.new(value:)
  end

  def insert_node(value:, node:)
    return Node.new(value:) if node.nil?
    return node if node.value == value

    if node.value < value
      node.right = insert_node(node: node.right, value:)
    else
      node.left = insert_node(node: node.left, value:)
    end

    node
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    nums = [1, 2, 3]

    bst.populate(nums)
    bst.pretty_print
  end

  def test_2
    bst = BinarySearchTree.new
    nums = [1, 2, 3, 4, 5, 6]

    bst.populate(nums)
    bst.pretty_print
  end
end
