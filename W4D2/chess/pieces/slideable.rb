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

    private

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
            cur_row += dx
            cur_col += dy
            if board[cur_row, cur_col].value == self.value #is a good guy piece,
                puts "you'll hit your own guy!"
                moveable = false
            elsif board[cur_row, cur_col] #is a bad guy piece,
                puts "knock out the bad guy!"
                result << [cur_row, cur_col]
                moveable = false
            elsif board[cur_row, cur_col] #is a null_peice
                puts "empty space!"
                result << [cur_row, cur_col]
            end
        end

        result
    end
end