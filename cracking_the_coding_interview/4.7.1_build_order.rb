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

class Project
  def initialize(projects, dependencies)
    @projects = projects
    @dependencies = dependencies
  end

  def find_build_order
    build_order = []
    queue = find_independent_projects

    until queue.empty?
      project = queue.shift

      next if build_order.include?(project)

      project_deps = find_dependent_projects(project)

      build_order.append(project)
      queue += project_deps
    end

    build_order
  end

  private

  attr_reader :projects, :dependencies

  def find_independent_projects
    dependent_projects = dependencies.map { |deps| deps[1] }.uniq

    projects - dependent_projects
  end

  def find_dependent_projects(project)
    dependencies.filter_map do |deps|
      next unless deps[0] == project

      deps[1]
    end
  end
end

class TestProject < Minitest::Test
  def setup
    @n_a = Node.new(data: 'a')
    @n_b = Node.new(data: 'b')
    @n_c = Node.new(data: 'c')
    @n_d = Node.new(data: 'd')
    @n_e = Node.new(data: 'e')
    @n_f = Node.new(data: 'f')
  end

  def test_1
    projects = [@n_a, @n_b, @n_c, @n_d, @n_e, @n_f]
    dependencies = [[@n_a, @n_d], [@n_f, @n_b], [@n_b, @n_d], [@n_f, @n_a], [@n_d, @n_c]]
    output = [@n_e, @n_f, @n_b, @n_a, @n_d, @n_c]

    assert_equal output, Project.new(projects, dependencies).find_build_order
  end
end
