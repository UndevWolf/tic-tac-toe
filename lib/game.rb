# frozen_string_literal: true

# tic tac toe main game class.
class GameRound
  attr_reader :player_one, :player_two

  def initialize
    puts "Enter Player 1's name: "
    player_one = gets.chomp
    puts "Enter Player 2's name: "
    player_two = gets.chomp
    @player_one = Player.new(player_one)
    @player_two = Player.new(player_two)
  end
end
