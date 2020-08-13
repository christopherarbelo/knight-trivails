# frozen_string_literal: true

require_relative 'node'
require_relative 'chess_board'

# Knight class
class Knight
  attr_reader :knight_moves, :chess_board
  def initialize
    @chess_board = ChessBoard.board
    @knight_moves = [[-1, +2], [+1, +2], [+2, +1], [+2, -1], [+1, -2], [-1, -2], [-2, -1], [-2, +1]]
  end

  def shortest_path(origin_coordinate, target_coordinate, nodes = [Node.new(origin_coordinate)])
    match = nodes.find_index { |node| node.coordinate == target_coordinate }
    return nodes[match].ancestors.map(&:coordinate) + [nodes[match].coordinate] if match

    shortest_path(origin_coordinate, target_coordinate, get_children(nodes))
  end

  def get_children(nodes)
    level_children = []
    nodes.each do |node|
      knight_moves.each do |knight_move|
        potential_move = move_position(node, knight_move)
        next unless inbound?(potential_move)

        level_children << Node.new(potential_move).add_ancestors(node.ancestors + [node])
      end
    end
    level_children
  end

  def move_position(node, knight_move)
    coordinate = []
    coordinate << node.coordinate.first + knight_move.first
    coordinate << node.coordinate.last + knight_move.last
    coordinate
  end

  def inbound?(potential_move)
    chess_board.include?(potential_move)
  end
end
