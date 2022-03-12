# frozen_string_literal: true

# Design an algorithm and write code to find the first common ancestor
# of two nodes in a binary tree.

# Avoid storing additional nodes in a data structure.
# NOTE: This is not necessarily a binary search tree.

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

  def ancestor(node1:, node2:, root_node: root)
    return if root_node.nil?
    return root_node if root_node == node1 && root_node == node2

    left_node = ancestor(root_node: root_node.left, node1:, node2:)

    return left_node if left_node && left_node != node1 && left_node != node2

    right_node = ancestor(root_node: root_node.right, node1:, node2:)

    return right_node if right_node && right_node != node1 && right_node != node2

    return root_node if !left_node.nil? && !right_node.nil?
    return root_node if root_node == node1 || root_node == node2

    left_node.nil? ? right_node : left_node
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
end

class Test < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(value: 7)
    bst.insert(value: 2)
    bst.insert(value: 9)
    bst.insert(value: 1)
    bst.insert(value: 5)
    bst.insert(value: 0)
    bst.insert(value: 3)

    bst.pretty_print

    node1 = bst.root.right
    node2 = bst.root.left
    assert_equal 7, bst.ancestor(node1:, node2:).value

    node1 = bst.root.right
    node2 = bst.root.left.right
    assert_equal 7, bst.ancestor(node1:, node2:).value

    node1 = bst.root.left.right.left
    node2 = bst.root.left.left.left
    assert_equal 2, bst.ancestor(node1:, node2:).value
  end
end
