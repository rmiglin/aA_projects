require "singleton"
require_relative '../piece.rb'
class NullPiece < Piece

include Singleton

def initialize
    @value = :blank
    @symbol = ""
end

end