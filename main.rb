# frozen_string_literal: true

require './lib/player'
require './lib/game'

def clear
  Gem.win_platform? ? system('cls') : system('clear')
end

puts "Enter Player 1's name: "
player_one = Player.new(gets.chomp)
puts "Enter Player 2's name: "
player_two = Player.new(gets.chomp)
clear
GameRound.new(player_one, player_two).play
