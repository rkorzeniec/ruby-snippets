# frozen_string_literal: true

# A binary search tree was created by traversing through an array from
# left to right and inserting each element.

# Given a binary search tree with distinct elements,
# print all possible arrays that could have led to this tree.

# EXAMPLE

# Input:
#     2
#    / \
#   1   3

# Output: {2, 1, 3}, {2, 3, 1}

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

  def sequences(node: root)
    return if node.nil?

    left_sequence = sequences(node: node.left)
    right_sequence = sequences(node: node.right)
    permutations = permutations(left_sequence, right_sequence)

    return [[node.value]] if permutations.nil?

    permutations.each do |permutation|
      permutation.prepend(node.value)
    end

    permutations
  end

  private

  def initialize_root(value)
    @root = Node.new(value:)
  end

  def insert_node(value:, node: root)
    return Node.new(value:) if node.nil?
    return node if node.value == value

    if node.value < value
      node.right = insert_node(value:, node: node.right)
    else
      node.left = insert_node(value:, node: node.left)
    end

    node
  end

  def permutations(left, right)
    return right if left.nil?
    return left if right.nil?

    result = []
    left.size.times do |i|
      right.size.times do |j|
        result.append(permutate(left: left[i], right: right[j]))
      end
    end

    result
  end

  def permutate(left:, right:, perms: [], prefix: [], i: 0, j: 0)
    return perms.append(prefix.slice(0)) if i == left.size && j == right.size

    if i < left.size
      prefix.push(left[i])
      permutate(perms:, left:, right:, prefix:, i: i + 1, j:)
      prefix.pop
    end

    if j < right.size
      prefix.push(right[j])
      permutate(perms:, left:, right:, prefix:, i:, j: j + 1)
      prefix.pop
    end

    perms
  end
end

class Test < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(value: 2)
    bst.insert(value: 1)
    bst.insert(value: 3)

    # bst.pretty_print

    assert_equal [[2, 1, 3], [2, 3, 1]], bst.sequences
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(value: 4)
    bst.insert(value: 2)
    bst.insert(value: 3)
    bst.insert(value: 1)
    bst.insert(value: 5)

    bst.pretty_print

    output = [
      [4, 2, 1, 3, 5],
      [4, 2, 1, 5, 3],
      [4, 2, 5, 1, 3],
      [4, 5, 2, 1, 3],
      [4, 2, 3, 1, 5],
      [4, 2, 3, 5, 1],
      [4, 2, 5, 3, 1],
      [4, 5, 2, 3, 1]
    ]

    assert_equal output, bst.sequences
  end
end
