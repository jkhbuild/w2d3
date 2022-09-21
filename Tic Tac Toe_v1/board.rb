class Board

    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end

    def valid?(coordinates)
        coordinates.each { |cord| return false if cord < 0 || cord > @grid.length - 1 }
        true
    end

    def empty?(coordinates)
        y = coordinates[0]
        x = coordinates[-1]
        @grid[y][x] == "_"
    end

    def place_mark(coordinates, symbol)
        y = coordinates[0]
        x = coordinates[-1]
        if self.empty?(coordinates) && self.valid?(coordinates)
            @grid[y][x] = symbol
        else
            raise "invalid mark"
        end
    end
end