# T1 and T2 are two very large binary trees, with T1 much bigger than T2. Create an
# algorithm to determine if T2 is a subtree of T1.

# A tree T2 is a subtree of T1 if there exists a node n in T1
# such that the subtree of n is identical to T2.

# That is, if you cut off the tree at node n, the two trees would be identical.

require_relative '../test_helper'

class Node
  attr_accessor :value, :left, :right

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinaryTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def subtree?(node1:, node2:)
    node1_elements = ordered_elements(node1)
    node2_elements = ordered_elements(node2)

    !node1_elements.index(node2_elements).nil?
  end

  private

  def ordered_elements(node, result = '')
    if node.nil?
      result << 'X'
      return
    end

    result << node.value
    ordered_elements(node.left, result)
    ordered_elements(node.right, result)

    result
  end
end

class Test < Minitest::Test
  def test_1
    bst = BinaryTree.new
    n4 = Node.new(value: 4)
    n3 = Node.new(value: 3)
    n2 = Node.new(value: 2, left: n4)
    n1 = Node.new(value: 1, left: n2, right: n3)


    assert_equal true, bst.subtree?(node1: n1, node2: n2)
  end
end
