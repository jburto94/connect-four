require_relative 'piece'

class Board
  include Piece

  attr_accessor :grid

  def initialize()
    @grid = create_board
  end

  def create_board
    Array.new(6) { Array.new(7) { empty_piece } }
  end

  def display_board
  end

  def format_board
  end

  def update_board
  end

  def clear_board
  end
end