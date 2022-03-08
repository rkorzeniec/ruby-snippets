# frozen_string_literal: true

# Given a binary tree, design an algorithm which creates a linked list of all the nodes
# at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).

require 'minitest/autorun'

ListNode = Struct.new('ListNode', :value, :next)

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def add_node(value)
    node = ListNode.new(value)

    @head = node if head.nil?

    @tail.next = node unless tail.nil?
    @tail = node
    @size += 1

    node
  end
end

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

  def list_of_depths(node: root, lists: [], level: 0)
    return if node.nil?

    list = fetch_list(lists, level)

    list.add_node(node)
    list_of_depths(node: node.left, lists:, level: level + 1)
    list_of_depths(node: node.right, lists:, level: level + 1)

    lists
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

  def fetch_list(lists, level)
    return lists[level] unless lists[level].nil?

    list = LinkedList.new
    lists.append(list)
    list
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

    lists = bst.list_of_depths
    assert_equal 3, lists.size

    head = lists[0].head
    assert_equal 1, lists[0].size
    assert_equal 7, head.value.value

    head = lists[1].head
    assert_equal 2, lists[1].size
    assert_equal 5, head.value.value
    assert_equal 9, head.next.value.value

    head = lists[2].head
    assert_equal 2, lists[2].size
    assert_equal 8, head.value.value
    assert_equal 10, head.next.value.value
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

    lists = bst.list_of_depths
    assert_equal 4, lists.size

    head = lists[0].head
    assert_equal 1, lists[0].size
    assert_equal 12, head.value.value

    head = lists[1].head
    assert_equal 2, lists[1].size
    assert_equal 8, head.value.value
    assert_equal 19, head.next.value.value

    head = lists[2].head
    assert_equal 4, lists[2].size
    assert_equal 4, head.value.value
    assert_equal 9, head.next.value.value
    assert_equal 15, head.next.next.value.value
    assert_equal 20, head.next.next.next.value.value

    head = lists[3].head
    assert_equal 5, lists[3].size
    assert_equal 2, head.value.value
    assert_equal 6, head.next.value.value
    assert_equal 10, head.next.next.value.value
    assert_equal 16, head.next.next.next.value.value
    assert_equal 21, head.next.next.next.next.value.value
  end
end
