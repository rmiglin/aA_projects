require 'byebug'

module Slideable
        HORIZONTAL_DIRS = [
            [-1,0],
            [1, 0],
            [0, 1],
            [0, -1]
    ].freeze
        DIAGONAL_DIRS = [
            [-1, 1],
            [1, 1],
            [-1, -1],
            [1, -1]
    ].freeze


    def moves
        result = []        
    end

    #private

    def move_dirs
        # #rook
        # HORIZONTAL_DIRS
        # #bishop
        # DIAGONAL_DIRS
        # #queen
        # HORIZONTAL_DIRS + DIAGONAL_DIRS
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        result = []
        cur_row, cur_col = self.pos
        moveable = true
        while moveable #iterate for some time
            #debugger
            cur_row += dx
            cur_col += dy
            cur_pos = [cur_row, cur_col]
            if !valid_moves.include?([cur_row, cur_col])
                break
            end
            if board[cur_pos].value == self.value #&& valid_moves.include?([cur_row, cur_col]) #is a good guy piece,
                puts "you'll hit your own guy!"
                moveable = false
            elsif board[cur_pos].value == :blank #&& self.valid_moves.include?([cur_row, cur_col]) #is a null_peice
                puts "empty space!"
                result << [cur_row, cur_col]
            else #board[cur_row, cur_col] #is a bad guy piece,
                puts "knock out the bad guy!"
                result << [cur_row, cur_col]
                moveable = false
            end
        end

        result
    end
end