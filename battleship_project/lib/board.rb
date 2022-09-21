require "byebug"
class Board

    attr_reader :size, :grid
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = (n * n)
    end

    def [](pos)
        @grid[pos[0]][pos[-1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[-1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each { |pos| count += 1 if pos == :S }
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        number_of_ships = @grid.flatten.length / 4
        n = @grid.length - 1

        while @grid.flatten.count(:S) < number_of_ships
            random_pos = [rand(0..n-1), rand(0..n-1)]
            self[random_pos] = :S
        end
    end

    def hidden_ships_grid
        n = @grid.length
        hidden_grid = Array.new(n) {Array.new(n, :N)}
        @grid.each_with_index do |row, i1|
            row.each_with_index do |value, i2|
                if value != :S
                    hidden_grid[i1][i2] = value
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid_print_output = ""
        grid.each_with_index do |row, i1|
            row.each_with_index do |value, i2|
                if i2 < row.length - 1
                    print value.to_s + " "
                else
                    print value.to_s
                    print "\n"
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
