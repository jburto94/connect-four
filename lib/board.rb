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

  def update_board(column, piece)
    (5).downto(0) do |row|
      if grid[row][column] == empty_piece
        grid[row][column] = piece
        return piece
      end
    end
    return false
  end

  def column_full?(column)
  end

  def clear_board
  end

  def display_board
  end

  def format_board
  end

  def clear_board
  end
end