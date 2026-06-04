# frozen_string_literal: true

# tic tac toe main game class.
class GameRound
  attr_accessor :cell

  def initialize
    @cell = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    display_grid
  end

  def display_grid
    clear
    puts "
    #{@cell[0]}   |   #{@cell[1]}  |  #{@cell[2]}
  ------|------|------
    #{@cell[3]}   |   #{@cell[4]}  |  #{@cell[5]}
  ------|------|------
    #{@cell[6]}   |   #{@cell[7]}  |  #{@cell[8]}   "
  end
end
