require_relative '../piece'
require_relative 'slideable'

class Rook < Piece

    include Slideable

    #protected

    def move_dirs
        HORIZONTAL_DIRS
    end

end