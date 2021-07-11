require_relative 'player'
require_relative 'code'

class Mastermind

  attr_accessor :code

  def initialize
    @player = Player.new
    @code = Code.new(["B", "G", "Y", "G"])
    @player_guess = Code.new([])
  end

  def get_player_guess
    @player_guess = Code.new(@player.get_guess.split(""))
  end

  def display
    puts @player_guess
    puts "Exact matches: "
    puts "Near matches: "
    puts "-----------------------"
  end

  def won?
    @player_guess.code == @code.code
  end

end