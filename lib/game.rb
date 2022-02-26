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
    streak = 0
    piece = board.blue_piece

    (5).downto(0) do |row|
      (0..6).each do |column|  
        slot = board.grid[row][column]
        if slot == piece
          streak += 1
        elsif slot == board.empty_piece
          streak = 0
          piece = nil
        else
          streak = 1
          piece = slot
        end
        return true if streak >= 4
      end
    end

    return false
  end
  
  def left_diagonal_win?
    (0..3).each do |c|
      (5).downto(3) do |r|
        slot = board.grid[r][c]
        streak2 = board.grid[r - 1][c + 1]
        streak3 = board.grid[r - 2][c + 2]
        streak4 = board.grid[r - 3][c + 3]
        streak = [slot, streak2, streak3, streak4]
        break if streak.any? { |piece| piece == board.empty_piece }
        return true if streak.all?(slot)
      end
    end
    return false
  end

  def right_diagonal_win?
    (6).downto(3) do |c|
      (5).downto(3) do |r|
        slot = board.grid[r][c]
        streak2 = board.grid[r - 1][c - 1]
        streak3 = board.grid[r - 2][c - 2]
        streak4 = board.grid[r - 3][c - 3]
        streak = [slot, streak2, streak3, streak4]
        break if streak.any? { |piece| piece == board.empty_piece }
        return true if streak.all?(slot)
      end
    end
    return false
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