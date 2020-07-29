#require_relative 'board'
require 'byebug'
class Piece

    attr_accessor :value, :pos, :board

    def initialize(pos, value, board)
        @pos = pos
        @value = value
        @board = board
    end

    def valid_moves
        #debugger
        moves_arr = []
        (0...8).each do |i|
            (0...8).each do |j|
                #if @board[[i, j]] !=
                if @board[[i, j]].is_a?(NullPiece) || @board[[i, j]].value != self.value
                    moves_arr << [i, j] 
                end
            end
        end
        moves_arr
    end
end

# module Slideable
# end

# module Stepable
# end