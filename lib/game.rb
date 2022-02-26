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

  def get_turn
  end

  def valid_turn?
  end

  def play
  end

  def switch_turn
  end

  def win?
  end

  def vertical_win?
  end

  def horizontal_win?
  end
  
  def left_diagonal_win?
  end

  def right_diagonal_win?
  end

  def game_over?
  end

  def display_winner
  end

  def play_again?
  end
end