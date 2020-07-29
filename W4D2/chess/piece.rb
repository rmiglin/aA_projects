require_relative 'board'

class Piece

    attr_accessor :value, :pos, :board

    def initialize(pos, value, board)
        @pos = pos
        @value = value
        @board = board
    end

    def valid_moves
        moves_arr = []
        (0...self.board.length).each do |i|
            (0...self.board.length).each do |j|
                moves_arr << [i, j] if @board[i][j] == nil || @board[i][j].value != self.value
            end
        end
        moves_arr
    end
end

# module Slideable
# end

# module Stepable
# end