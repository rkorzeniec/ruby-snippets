# frozen_string_literal: true

# Given a sorted (increasing order) array with unique integer elements, write an algo­rithm
# to create a binary search tree with minimal height.

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
  attr_reader :root

  def initialize
    @root = nil
  end

  def populate(array)
    return if array.size < 1
    return insert(array.first) if array.size == 1

    pivot = array.size / 2

    insert(array[pivot])
    populate(array[0...pivot])
    populate(array[pivot..])
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
    array = [1, 2, 3, 4, 5]

    bst.populate(array)

    # bst.pretty_print
    root = bst.root
    assert_equal 3, root.value
    assert_equal 2, root.left.value
    assert_equal 4, root.right.value

    assert_equal 1, root.left.left.value
    assert_nil root.left.right

    assert_equal 5, root.right.right.value
    assert_nil root.right.left
  end

  def test_2
    bst = BinarySearchTree.new
    array = [2, 4, 6, 8, 9, 10, 12, 15, 16, 19, 20, 21]

    bst.populate(array)

    # bst.pretty_print

    root = bst.root
    assert_equal 12, root.value
    assert_equal 8, root.left.value
    assert_equal 19, root.right.value

    assert_equal 4, root.left.left.value
    assert_equal 9, root.left.right.value

    assert_equal 2, root.left.left.left.value
    assert_equal 6, root.left.left.right.value

    assert_nil root.left.right.left
    assert_equal 10, root.left.right.right.value

    assert_equal 15, root.right.left.value
    assert_equal 20, root.right.right.value

    assert_equal 16, root.right.left.right.value
    assert_nil root.right.left.left

    assert_equal 21, root.right.right.right.value
    assert_nil root.right.right.left
  end
end
