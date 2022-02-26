require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board, :players
  attr_accessor :current_player

  def initialize()
    @board = Board.new
    @players = [
     Player.new('player1', 'red'),
     Player.new('player2', 'blue')
    ]
    @current_player = players[0]
  end

  def get_names
    players.each { |player| player.name = prompt_name(player.name) }
  end

  def prompt_name(player)
    name = ''
    until valid_name?(name) do
      puts "#{player} enter your name: "
      name = gets.chomp
    end
    name
  end

  def valid_name?(name)
    name.length.between?(1, 25)
  end

  def get_turn(player)
    turn = ''
    until valid_turn?(turn) do
      puts "Select column: "
      turn = gets.chomp
    end
    turn.to_i - 1
  end

  def valid_turn?(turn)
    return false unless ("1".."7").to_a.include?(turn)
    turn = turn.to_i - 1
    return false if board.column_full?(turn)
    return true
  end

  def play
    until game_over?
      board.display_board
      piece = get_piece
      column = get_turn(current_player)
      switch_turn
      board.update_board(column, piece)
    end

    display_winner
  end

  def get_piece
    current_player.color == "red" ? board.red_piece : board.blue_piece
  end

  def switch_turn
    @current_player = current_player.color == "red" ? players[1] : players[0] 
  end

  def win?
    vertical_win? || horizontal_win? || left_diagonal_win? || right_diagonal_win?
  end

  def vertical_win?
    streak = 0
    piece = board.blue_piece
    (0..6).each do |column|
      (5).downto(0) do |row|
        slot = board.grid[row][column]
        break if slot == board.empty_piece
        if slot == piece
          streak += 1
        else
          streak = 1
          piece = slot
        end
        return true if streak >= 4
      end
    end

    return false
  end

  def horizontal_win?
  end
  
  def left_diagonal_win?
  end

  def right_diagonal_win?
  end

  def game_over?
    win? || board.board_full?
  end

  def display_winner
    switch_turn
    board.display_board
    puts "Congratulations #{current_player.name}! You have won the game!"
  end
end