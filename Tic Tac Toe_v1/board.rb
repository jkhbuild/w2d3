require "byebug"
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

    def print_board
        @grid.each_with_index do |row, i1|
            row.each_with_index do |value, i2|
                if i2 < row.length - 1
                    print value.to_s + " "
                else
                    puts value.to_s
                end
            end
        end
    end

    def win_row?(mark)
        @grid.each { |row| return true if row.all?(mark)}
        false
    end

    def win_col?(mark)
        @grid.transpose.each { |col| return true if col.all?(mark) }
        false
    end

    def win_diagonal?(mark)

        ltr = [0, 0]
        ltr_values = []
        y = ltr[0]
        x = ltr[-1]

        while self.valid?([x, y]) #to check left to right diagonal
            ltr_values << @grid[y][x]

            x += 1
            y += 1
        end

        return true if ltr_values.all?(mark)

        rtl = [0, @grid.length-1]
        rtl_values = []
        y = rtl[0]
        x = rtl[-1]

        while self.valid?([x, y]) #to check right to left diagonal
            rtl_values << @grid[y][x]

            x -= 1
            y += 1
        end

        return true if rtl_values.all?(mark)
        false
    end

    def win?(mark)
        if win_row?(mark)
            return true
        elsif win_col?(mark)
            return true
        elsif win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |value|
                return true if value == "_"
            end
        end
        false
    end
end

b = Board.new

b.place_mark([0,0], :X)
b.place_mark([1,1], :X)
b.place_mark([2,2], :X)
b.win_diagonal?(:X)
print b.print_board