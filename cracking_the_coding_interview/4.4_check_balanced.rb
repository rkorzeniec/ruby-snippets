# frozen_string_literal: true

# Implement a function to check if a binary tree is balanced.

# For the purposes of this question,
# a balanced tree is defined to be a tree such that the heights of the two
# subtrees of any node never differ by more than one.

require_relative '../test_helper'

class BSTNode
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

  def insert(value)
    return initialize_root(value) if root.nil?

    insert_node(value, node: root)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def balanced?(node: root)
    return false if node.nil?

    left_height = height(node.left) || 0
    right_height = height(node.right) || 0

    (left_height - right_height).abs <= 1
  end

  private

  def initialize_root(value)
    @root = BSTNode.new(value:)
  end

  def insert_node(value, node: root)
    return BSTNode.new(value:) if node.nil?
    return node if node.value == value

    if node.value < value
      node.right = insert_node(value, node: node.right)
    else
      node.left = insert_node(value, node: node.left)
    end

    node
  end

  def height(node)
    return 0 if node.nil?

    1 + [height(node.left), height(node.right)].max
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

    assert_equal true, bst.balanced?
    assert_equal true, bst.balanced?(node: bst.root.left)
    assert_equal true, bst.balanced?(node: bst.root.right)
  end

  def test_2
    bst = BinarySearchTree.new
    bst.insert(12)
    bst.insert(8)
    bst.insert(19)
    bst.insert(4)
    bst.insert(9)
    bst.insert(2)
    bst.insert(6)
    bst.insert(10)
    bst.insert(15)
    bst.insert(20)
    bst.insert(16)
    bst.insert(21)

    # bst.pretty_print

    assert_equal true, bst.balanced?
    assert_equal true, bst.balanced?(node: bst.root.left)
    assert_equal true, bst.balanced?(node: bst.root.right)
  end

  def test_3
    bst = BinarySearchTree.new
    bst.insert(1)
    bst.insert(8)
    bst.insert(9)
    bst.insert(4)
    bst.insert(29)
    bst.insert(22)
    bst.insert(26)
    bst.insert(101)
    bst.insert(150)
    bst.insert(200)
    bst.insert(160)
    bst.insert(210)

    # bst.pretty_print

    assert_equal false, bst.balanced?
    assert_equal false, bst.balanced?(node: bst.root.left)
    assert_equal false, bst.balanced?(node: bst.root.right)
    assert_equal false, bst.balanced?(node: bst.root.right.right)
    assert_equal false, bst.balanced?(node: bst.root.right.right.right)
    assert_equal true, bst.balanced?(node: bst.root.right.right.right.left)
  end
end
