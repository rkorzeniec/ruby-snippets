# frozen_string_literal: true

# Given a directed graph,
# design an algorithm to find out whether there is a route between two nodes.

require 'minitest/autorun'

class Node
  attr_accessor :data, :adjecents

  def initialize(data:, adjecents: [])
    @data = data
    @adjecents = adjecents
  end

  def add_edge(node)
    adjecents.append(node)
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    nodes[node.data] = node
  end

  def route_exists?(start_node, end_node)
    return true if start_node == end_node

    visited = {}
    unvisited = [start_node]

    until unvisited.empty?
      node = unvisited.shift

      return true if node == end_node

      visited[node.data] = true

      node.adjecents.each do |adjecent_node|
        next if visited.key?(adjecent_node.data)

        unvisited.append(adjecent_node)
      end
    end

    false
  end
end

class TestGraph < Minitest::Test
  def setup
    @n6 = Node.new(data: 6)
    @n5 = Node.new(data: 5)
    @n4 = Node.new(data: 4)
    @n3 = Node.new(data: 3)
    @n2 = Node.new(data: 2)
    @n1 = Node.new(data: 1)

    @n1.add_edge(@n2)

    @n2.add_edge(@n3)
    @n2.add_edge(@n6)

    @n3.add_edge(@n1)
    @n3.add_edge(@n2)
    @n3.add_edge(@n4)

    @n4.add_edge(@n5)

    @n5.add_edge(@n4)
    @n5.add_edge(@n6)

    @graph = Graph.new
    @graph.add_node(@n1)
    @graph.add_node(@n2)
    @graph.add_node(@n3)
    @graph.add_node(@n4)
    @graph.add_node(@n5)
    @graph.add_node(@n6)
  end

  def test_1
    assert_equal true, @graph.route_exists?(@n1, @n5)
  end

  def test_2
    assert_equal true, @graph.route_exists?(@n4, @n6)
  end

  def test_3
    assert_equal false, @graph.route_exists?(@n4, @n1)
  end
end
