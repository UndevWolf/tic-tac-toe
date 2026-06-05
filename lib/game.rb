# frozen_string_literal: true

# tic tac toe main game class.
class GameRound
  attr_accessor :cell, :player_one, :player_two

  WIN = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze
  def initialize(player_one, player_two)
    @cell = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player_one = player_one
    @player_two = player_two
    display_grid
  end

  def display_grid
    clear
    puts "TIC TAC TOE
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
    [player_one, player_two].cycle do |player|
      choice = player.play
      if choice < 1 || choice > 9 || cell[choice - 1] != ' '
        puts 'invalid'
        redo
      end
      player_turn(choice, player)
      display_grid
      check_result(player)
    end
  end

  def player_turn(choice, player)
    if player == player_one
      cell[choice - 1] = 'O'
      player.owned_cells << choice
    elsif player == player_two
      cell[choice - 1] = 'X'
      player.owned_cells << choice
    end
  end

  def check_result(player)
    if WIN.any? do |i|
      i.all? { |i| player.owned_cells.include?(i) }
    end
      puts "#{player.name} wins!"
      exit
    elsif filled?
      puts "It's a tie."
      exit
    end
  end

  def clear
    Gem.win_platform? ? system('cls') : system('clear')
  end
end
