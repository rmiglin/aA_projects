require_relative 'piece'
require_relative './pieces/nullpiece'

class Board

    def self.get_state
        @rows
    end

    def initialize
        @rows = []
        i = 0
        while i < 8
            if i == 0 || i == 1 || i == 6 || i == 7
                sym = :W if i == 0 || i == 1
                sym = :B if i == 6 || i == 7
                j = 0
                row = []
                while j < 8
                    pos = [i, j]
                    #row << Piece.new(pos, sym, self)
                    ######
                    if i == 0 || i == 7
                        case j
                        when 0 || 7
                            row << Rook.new(pos, sym, self)
                        when 1 || 6
                            row << Knight.new(pos, sym, self)
                        when 2 || 5
                            row << Bishop.new(pos, sym, self)
                        when 3
                            row << Queen.new(pos, sym, self)
                        else
                            row << King.new(pos, sym, self)
                        end
                    else
                        row << Pawn.new(pos, sym, self)
                    end
                    ######
                    j += 1
                end
                @rows << row
            else
                @rows << Array.new(8, NullPiece.instance) 
            end
            i += 1
        end
    end
    
    def move_piece(start_pos, end_pos)
        raise "no piece at #{start_pos}" if self[start_pos].nil?
        end_row, end_col = end_pos
        if !end_row.between?(0,7) || !end_col.between?(0,7)
            raise "invalid end pos #{end_pos}" 
        end
        self[end_pos] = self[start_pos]
        self[end_pos].pos = end_pos
        self[start_pos] = NullPiece.instance
        #self[end_pos].board = @rows
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def print_board
        pretty_board = []
        @rows.each do |row|
            temp_row = []
            row.each do |piece|
                temp_row << (piece.nil? ? nil : piece.value ) 
            end
            pretty_board << temp_row
        end
        pretty_board.each { |row| print row }
    end



end