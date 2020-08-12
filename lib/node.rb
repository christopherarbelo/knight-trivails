# frozen_string_literal: true

# Node for Moves Possible Tree
class Node
  attr_reader :coordinate, :children, :ancestors
  def initialize(coordinate)
    @coordinate = coordinate
    @children = []
    @ancestors = []
  end

  def add_ancestors(ancestors)
    ancestors.each { |ancestor| self.ancestors << ancestor }
    self
  end

  def to_s
    "Coordinate: #{coordinate}, children: #{children.map(&:coordinate)}, ancestors: #{ancestors.map(&:coordinate)}"
  end
end
