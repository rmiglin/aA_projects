require_relative '../piece'
require_relative 'slideable'

class Pawn < Piece
    include Slideable
end