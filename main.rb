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
new_game = GameRound.new

[player_one, player_two].cycle do |player|
  choice = player.play
  if player == player_one && new_game.cell[choice - 1] == ' '
    new_game.cell[choice - 1] = 'O'
    player.owned_cells << choice
  elsif player == player_two && new_game.cell[choice - 1] == ' '
    new_game.cell[choice - 1] = 'X'
    player.owned_cells << choice
  elsif new_game.cell[choice - 1] != ' '
    puts 'Box is already picked.'
    redo
  end
  new_game.display_grid
  if [1, 5, 9].all? { |i| player.owned_cells.include?(i) } ||
     [3, 5, 7].all? { |i| player.owned_cells.include?(i) } ||
     [1, 4, 7].all? { |i| player.owned_cells.include?(i) } ||
     [2, 5, 8].all? { |i| player.owned_cells.include?(i) } ||
     [3, 6, 9].all? { |i| player.owned_cells.include?(i) } ||
     [1, 2, 3].all? { |i| player.owned_cells.include?(i) } ||
     [4, 5, 6].all? { |i| player.owned_cells.include?(i) } ||
     [7, 8, 9].all? { |i| player.owned_cells.include?(i) }
    puts "#{player.name} wins!"
    break
  elsif new_game.filled?
    puts "It's a tie."
    break
  end
end
