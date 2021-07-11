require_relative 'mastermind'

game = Mastermind.new

until game.won?
  game.display
  game.get_player_guess
end