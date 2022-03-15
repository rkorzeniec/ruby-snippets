# frozen_string_literal: true

# Write an algorithm to find the "next" node (i.e., in-order successor)
# of a given node in a binary search tree.
# You may assume that each node has a link to its parent.

require_relative '../test_helper'

class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(value: 0, left: nil, right: nil, parent: nil)
    @value = value
    @left = left
    @right = right
    @parent = parent
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize(root = nil)
    @root = root
    @last_value = nil
  end

  def insert(value)
    return initialize_root(value) if root.nil?

    insert_node(value, node: root)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value} (#{node.parent&.value})"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def successor(node = root)
    return if node.nil?
    return leftmost_child(node.right) if node.right

    current_node = node
    parent_node = current_node.parent

    while parent_node && parent_node.left != current_node
      current_node = parent_node
      parent_node = parent_node.parent

    end

    parent_node
  end

  private

  def initialize_root(value)
    @root = Node.new(value:)
  end

  def insert_node(value, node: root, parent: nil)
    return Node.new(value:, parent:) if node.nil?
    return node if node.value == value

    if node.value < value
      node.right = insert_node(value, node: node.right, parent: node)
    else
      node.left = insert_node(value, node: node.left, parent: node)
    end

    node
  end

  def leftmost_child(node)
    return if node.nil?

    node = node.left while node.left

    node
  end
end

class TestGraph < Minitest::Test
  def test_1
    bst = BinarySearchTree.new
    bst.insert(7)
    bst.insert(5)
    bst.insert(9)
    bst.insert(8)
    bst.insert(10)

    # bst.pretty_print

    assert_equal 7, bst.successor(bst.root.left).value
    assert_equal 8, bst.successor(bst.root).value
    assert_equal 9, bst.successor(bst.root.right.left).value
    assert_equal 10, bst.successor(bst.root.right).value
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(2)
    bst.insert(1)
    bst.insert(7)
    bst.insert(9)
    bst.insert(0)

    # bst.pretty_print

    assert_equal 1, bst.successor(bst.root.left.left).value
    assert_equal 2, bst.successor(bst.root.left).value
    assert_equal 7, bst.successor(bst.root).value
    assert_equal 9, bst.successor(bst.root.right).value
  end
end
