require_relative 'player'
require_relative 'code'

class Mastermind

  attr_accessor :code

  def initialize
    @player = Player.new
    @code = Code.new(["B", "G", "Y", "G"])
  end

  def get_player_guess
    @player.get_guess
  end

  def display
    puts "Exact matches: "
    puts "Near matches: "
    puts "-----------------------"
  end

end