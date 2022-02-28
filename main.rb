require ('./lib/game.rb')

def start_game
  new_game = Game.new

  new_game.play
  start_game if replay?
end

def replay?
  puts "Play another round? Type (Y/y) to play another, or anything else to stop: "
  response = gets.chomp

  response == 'Y' || response == 'y'
end

start_game