# frozen_string_literal: true

require './lib/player'
require './lib/game'

puts "Enter Player 1's name: "
player_one = Player.new(gets.chomp)
puts "Enter Player 2's name: "
player_two = Player.new(gets.chomp)
GameRound.new(player_one, player_two).play
