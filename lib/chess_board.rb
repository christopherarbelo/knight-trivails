# frozen_string_literal: true

# Chess game board
class ChessBoard
  def self.board
    board = []
    8.times { |x| 8.times { |y| board << [x, y] } }
    board
  end
end
