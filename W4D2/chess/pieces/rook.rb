require_relative '../piece.rb'
require_relative 'slideable'

class Rook < Piece

include Slideable

#protected

def move_dirs
    HORIZONTAL_DIRS
    #[[1 ,0], [0,1], [-1,0], [0,-1]]
end

end