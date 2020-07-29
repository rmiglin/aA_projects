require_relative '../piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def move_dirs
        DIAGONAL_DIRS + HORIZONTAL_DIRS
    end
end