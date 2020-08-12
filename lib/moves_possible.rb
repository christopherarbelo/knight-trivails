# frozen_string_literal: true

require_relative 'node'

# Tree like data structure for possible moves
class MovesPossible
  attr_reader :piece_moves, :root, :board
  def initialize(origin_position, board, piece_moves)
    @board = board
    @piece_moves = piece_moves
    @root = Node.new(origin_position)
  end

  def shortest_path(target_coordinate, nodes = [root])
    match = nodes.find_index { |node| node.coordinate == target_coordinate }
    return nodes[match].ancestors.map(&:coordinate) + [nodes[match].coordinate] if match

    shortest_path(target_coordinate, get_children(nodes))
  end

  def get_children(nodes)
    level_children = []
    nodes.each do |node|
      piece_moves.each do |piece_move|
        potential_move = move_position(node, piece_move)
        next unless inbound?(potential_move)

        level_children << Node.new(potential_move).add_ancestors(node.ancestors + [node])
      end
    end
    level_children
  end

  def move_position(node, piece_move)
    coordinate = []
    coordinate << node.coordinate.first + piece_move.first
    coordinate << node.coordinate.last + piece_move.last
    coordinate
  end

  def inbound?(potential_move)
    board.include?(potential_move)
  end
end
