# frozen_string_literal: true

# Implement a function to check if a binary tree is a binary search tree.

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

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def valid?(node: root, min: nil, max: nil)
    return true if node.nil?
    return false if (min && node.value <= min) || (max && node.value > max)

    valid?(node: node.left, min:, max: node.value) &&
      valid?(node: node.right, min: node.value, max:)
  end

  private

  def initialize_root(value)
    @root = Node.new(value:)
  end

  def insert_node(value, node: root)
    return Node.new(value:) if node.nil?
    return node if node.value == value

    if node.value < value
      node.right = insert_node(value, node: node.right)
    else
      node.left = insert_node(value, node: node.left)
    end

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

    assert_equal true, bst.valid?
  end

  def test_2
    n0 = Node.new(value: 2)
    n1 = Node.new(value: 1)
    n2 = Node.new(value: 7)
    n3 = Node.new(value: 5)
    n4 = Node.new(value: 9)
    n5 = Node.new(value: 0)

    n0.right = n5
    n1.left = n0
    n1.right = n3
    n3.left = n4
    n3.right = n2

    bst = BinarySearchTree.new(n1)
    # bst.pretty_print

    assert_equal false, bst.valid?
  end
end
