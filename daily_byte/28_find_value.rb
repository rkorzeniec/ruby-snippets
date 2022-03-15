# frozen_string_literal: true

# This question is asked by Google.
# Given the reference to the root of a binary search tree and a search value,
# return the reference to the node that contains the value if it exists and null otherwise.

# NOTE: all values in the binary search tree will be unique.

# Ex: Given the tree...

#         3
#        / \
#       1   4
# and the search value 1 return a reference to the node containing 1.

# Ex: Given the following tree...
#         7
#        / \
#       5   9
#          / \
#         8   10
# and the search value 9 return a reference to the node containing 9.

# Ex: Given the following tree...
#         8
#        / \
#       6   9
# and the search value 7 return null.

require_relative '../test_helper'

class Node
  attr_accessor :value, :left, :right

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    return @root = Node.new(value:) if root.nil?

    leaf_node = traverse_tree(value)

    insert_child(leaf_node, value)
  end

  def find(value:, node: root)
    return if node.nil?
    return node if node.value == value

    if node.value < value
      find(node: node.right, value:)
    else
      find(node: node.left, value:)
    end
  end

  def to_s(node: root)
    return if node.nil?

    to_s(node: node.left)

    print "#{node.value} -> "

    to_s(node: node.right)
  end

  private

  attr_reader :root

  def traverse_tree(value)
    current_node = root
    previous_node = root

    until current_node.nil?
      previous_node = current_node

      current_node = value < current_node.value ? current_node.left : current_node.right
    end

    previous_node
  end

  def insert_child(node, value)
    if value < node.value
      node.left = Node.new(value:)
    else
      node.right = Node.new(value:)
    end
  end
end

class TestBinarySearchTree < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)

    result = bst.find(value: 1)

    assert_instance_of Node, result
    assert_equal 1, result.value
    assert_nil result.left
    assert_nil result.right
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(7)
    bst.insert(5)
    bst.insert(9)
    bst.insert(8)
    bst.insert(10)

    result = bst.find(value: 9)

    assert_instance_of Node, result
    assert_equal 9, result.value
    assert_equal 8, result.left.value
    assert_equal 10, result.right.value
  end

  def test_3
    bst = BinarySearchTree.new
    bst.insert(8)
    bst.insert(6)
    bst.insert(9)

    result = bst.find(value: 7)

    assert_nil result
  end
end
