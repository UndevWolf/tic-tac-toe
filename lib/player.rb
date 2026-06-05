# frozen_string_literal: true

# tic tac toe player class
class Player
  attr_accessor :name, :owned_cells, :filled_cells

  def initialize(name)
    @name = name
    @owned_cells = []
  end

  def play
    puts "It's your turn, #{name}. Select a box from 1-9."
    gets.chomp.to_i
  end
end
