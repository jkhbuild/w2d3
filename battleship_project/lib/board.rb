require "byebug"
class Board

    attr_reader :size
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


  
end
