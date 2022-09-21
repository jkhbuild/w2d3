require "byebug"
require_relative "./board.rb"
class Human_player
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "player " + @mark.to_s
        puts "enter a position (2 numbers between 0-2, with a space b/w them)"

        input = gets.chomp
        alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

        raise "invalid position" if input.length != 3

        input.each_char { |char| raise "invalid position" if alpha.include?(char) }
        raise "invalid position" if input.split("").count(" ") != 1

        numbers = "0123456789"
        input_arr = []
        input.each_char {|ele| input_arr << ele.to_i if numbers.include?(ele)}
        input_arr
    end
end