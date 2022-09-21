require_relative "./board.rb"
require_relative "./human_player.rb"
require "byebug"

class Game
    def initialize(mark_1, mark_2)
        @player_1 = Human_player.new(mark_1)
        @player_2 = Human_player.new(mark_2)
        @current_player = @player_1
        @board = Board.new
        @turn = 0
    end

    def switch_turn
        if @turn.even?
            @current_player = @player_2
            @turn += 1
        else
            @current_player = @player_1
            @turn += 1
        end
    end

    def play

        while @board.empty_positions?
            @board.print_board
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                return "victory"
            else
                self.switch_turn
            end
        end

        print "draw"
    end

end
        