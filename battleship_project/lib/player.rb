class Player
    def get_move
        print "enter a position with coordinates seperated with a space like '4, 7'"
        input = gets.chomp

        numbers = "0123456789"
        input_arr = []
        input.each_char {|ele| input_arr << ele.to_i if numbers.include?(ele)}
        input_arr
    end
end
