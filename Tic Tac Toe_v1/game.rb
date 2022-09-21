require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def intiialize(mark1, mark2)
        @marks = marks
        @player_1 = Player.new(mark1)
        @player_2 = Player.new(mark2)
        @current_player = @player_1
        @board = board.new
    end

    def switch_turn
        turn = 0

        if turn.even?
            @current_player = @player_1
            turn += 1
        else
            @current_player = @player_2
            turn += 1
        end
    end

    def play

        while @board.empty_positions?
            @board.print_board
            @board.place_mark(@current_player.get_position)
            if @board.win?(@current_player.mark)
                print "victory"
            else
                self.switch_turn
            end
        end

        print "draw"
    end

end


        