require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses > 0
            return false
        else
            print "you lose"
            true
        end
    end

    def win?
        if @board.num_ships > 0
            return false
        else
            print "you win"
            true
        end
    end

    def game_over?
        if self.win? || self.lose?
            return true
        else
            false
        end
    end

    def turn
        if !@board.attack(@player.get_move)
            @remaining_misses -= 1
        end

        @board.print
        print @remaining_misses
    end

end
