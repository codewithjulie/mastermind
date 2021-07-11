require_relative 'mastermind'

game = Mastermind.new

until game.game_over?
  game.display
  game.get_player_guess
end