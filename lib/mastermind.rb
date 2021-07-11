require_relative 'player'
require_relative 'code'

class Mastermind

  attr_accessor :code

  def initialize
    @player = Player.new
    @code = Code.new(["B", "G", "Y", "G"])
    @player_guess = Code.new([])
    @guesses_remaining = 3
  end

  def get_player_guess
    @player_guess = Code.new(@player.get_guess.split(""))
    if @player_guess.code.size == 4
      @guesses_remaining -= 1
    end
  end

  def display
    puts @player_guess
    puts "Exact matches: #{get_exact_matches}"
    puts "Near matches: "
    puts "-----------------------"
  end

  def won?
    @player_guess.code == @code.code
  end

  def lost?
    @guesses_remaining <= 0
  end

  def game_over?
    won? || lost?
  end

  def get_exact_matches
    count = 0
    @code.code.size.times do |index|
      if @code.code[index] == @player_guess.code[index]
        count += 1
      end
    end
    count
  end

end