require_relative 'piece'

class Board
  include Piece

  attr_accessor :grid

  def initialize()
    @grid = new_board
  end

  def new_board
    Array.new(6) { Array.new(7) { empty_piece } }
  end

  def update_board(column, piece)
    return false if column_full?(column)

    (5).downto(0) do |row|
      if grid[row][column] == empty_piece
        grid[row][column] = piece
        return piece
      end
    end
  end

  def column_full?(column)
    (0..5).none? { |row| grid[row][column] == empty_piece }
  end

  def display_board
    grid.each do |row|
      print "| "
      row.each do |column|
        print "#{column} "
      end
      puts "|"
    end
    puts "  - - - - - - -  "
    puts "  1 2 3 4 5 6 7  "
  end
end