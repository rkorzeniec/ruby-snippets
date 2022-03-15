# frozen_string_literal: true

# https://leetcode.com/problems/number-of-enclaves/

require_relative '../test_helper'

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

  def add_node(key, node)
    nodes[node.data] = node
  end
end

class Solution
  class << self
    def num_enclaves(grid)
      graph = Graph.new
      exterior_node = Node.new(data: nil)

      grid.size.times do |n|
        grid[0].size.times do |m|
          node = Node.new(data: grid[n][m])
          graph.add_node(n + m, node)

          if n == 0 || n + 1 == grid.size || m == 0 || m + 1 == grid[0].size
            exterior_node.add_edge(node)
            node.add_edge(exterior_node)
          end
        end
      end

      graph.nodes.filter_map do |_, node|
        node unless node.adjecents.include?(exterior_node)
      end
    end
  end
end

class TestSolution < Minitest::Test
  def test_1
    grid = [
      [0, 0, 0, 0],
      [1, 0, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0]
    ]
    output = 3

    assert_equal output, Solution.num_enclaves(grid)
  end

  def test_2
    grid = [
      [0, 1, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0]
    ]
    output = 0

    assert_equal output, Solution.num_enclaves(grid)
  end
end
