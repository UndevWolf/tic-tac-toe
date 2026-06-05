# frozen_string_literal: true

# tic tac toe main game class.
class GameRound
  attr_accessor :cell

  def initialize(player_one, player_two)
    @cell = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player_one = player_one
    @player_two = player_two
    display_grid
  end

  def display_grid
    clear
    puts "
    #{@cell[0]}   |   #{@cell[1]}   |  #{@cell[2]}
  ------|-------|------
    #{@cell[3]}   |   #{@cell[4]}   |  #{@cell[5]}
  ------|-------|------
    #{@cell[6]}   |   #{@cell[7]}   |  #{@cell[8]}   "
  end

  def filled?
    (1..9).all? do |i|
      cell[i - 1] != ' '
    end
  end

  def play
    [@player_one, @player_two].cycle do |player|
      choice = player.play
      if player == @player_one && cell[choice - 1] == ' '
        cell[choice - 1] = 'O'
        player.owned_cells << choice
      elsif player == @player_two && cell[choice - 1] == ' '
        cell[choice - 1] = 'X'
        player.owned_cells << choice
      elsif cell[choice - 1] != ' '
        puts 'Box is already picked.'
        redo
      end
      display_grid
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
      elsif filled?
        puts "It's a tie."
        break
      end
    end
  end
end
