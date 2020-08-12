# frozen_string_literal: true

require_relative 'moves_possible'

# Knight class containing graph of moves
class Knight
  attr_accessor :origin_position
  attr_reader :knight_moves, :chess_board
  def initialize(origin_position)
    @chess_board = ChessBoard.board
    @origin_position = origin_position
    @knight_moves = [[-1, +2], [+1, +2], [+2, +1], [+2, -1], [+1, -2], [-1, -2], [-2, -1], [-2, +1]]
  end
end
