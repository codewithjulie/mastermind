require_relative 'player'

class Mastermind

  COLORS = ["O", "W", "B", "R", "G", "Y", "o", "w", "b", "r", "g", "y"]

  def initialize
    @player = Player.new
    @code = Code.new("BGYB")
  end

  def valid_peg?(peg)
    COLORS.include?(peg)
  end

  def valid_guess?
    @player.get_guess.split("").all? {|peg| valid_peg?(peg)}
  end



end