# frozen_string_literal: true

# You are given a list of projects and a list of dependencies
# (which is a list of pairs of projects, where the second project is dependent on the first project).
# All of a project's dependencies must be built before the project is.
# Find a build order that will allow the projects to be built.
# If there is no valid build order, return an error.

# EXAMPLE

# Input:
# projects: a, b, c, d, e, f
# dependencies: (a, d), (f, b), (b, d), (f, a), (d, c)

# Output: f, e, a, b, d, c

require_relative '../test_helper'

class Node
  attr_accessor :data, :adjecents, :state

  def initialize(data:, adjecents: [])
    @data = data
    @adjecents = adjecents
    @state = 'BLANK'
  end

  def add_edge(node)
    adjecents.append(node)
  end

  def blank_state?
    state == 'BLANK'
  end

  def partial_state?
    state == 'PARTIAL'
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(data)
    nodes[data] = Node.new(data:)
  end

  def build(projects, dependencies)
    projects.each do |project|
      add_node(project)
    end

    dependencies.each do |dep|
      nodes[dep[0]].adjecents.append(nodes[dep[1]])
    end
  end
end

class Project
  def find_build_order(projects, dependencies)
    graph = Graph.new
    graph.build(projects, dependencies)

    order_projects(graph.nodes.values)
  end

  private

  def order_projects(projects)
    stack = []

    projects.each do |project|
      next unless project.blank_state?

      return false unless depth_first_search(project, stack)
    end

    stack
  end

  def depth_first_search(project, stack)
    return false if project.partial_state?
    return true unless project.blank_state?

    project.state = 'PARTIAL'
    project.adjecents.each do |dep|
      return false unless depth_first_search(dep, stack)
    end

    project.state = 'COMPLETE'
    stack.prepend(project)

    true
  end
end

class TestProject < Minitest::Test
  def test_1
    projects = %w[a b c d e f]
    dependencies = [%w[a d], %w[f b], %w[b d], %w[f a], %w[d c]]
    output = %w[f e b a d c]

    build_order = Project.new.find_build_order(projects, dependencies).map { |p| p.data }

    assert_equal output, build_order
  end
end
