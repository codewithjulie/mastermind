require_relative 'player'
require_relative 'code'

class Mastermind

  attr_accessor :code

  def initialize
    @player = Player.new
    @code = Code.get_random_code(4)
    @player_guess = Code.new([])
    @guesses_remaining = 12
  end

  def get_player_guess
    @player_guess = Code.new(@player.get_guess.split(""))
    if @player_guess.code.size == 4
      @guesses_remaining -= 1
    end
  end

  def display
    if game_over?
      if won?
        puts "Congratulations! You won!"
        print @player_guess
      elsif lost?
        puts "Better luck next time!"
        puts @code
      end
    else
      print @player_guess
      print "   Exact matches: #{get_exact_matches}"
      print "   Near matches: #{get_near_matches}"
      puts "    Number of guesses remaining: #{@guesses_remaining}"
      puts "-----------------------"
    end
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
    (0...@code.code.size).count {|index| @code[index] == @player_guess[index]}
  end

  def get_near_matches
    code_hash = @code.get_hash
    player_hash = @player_guess.get_hash

    count = 0

    code_hash.each do |color, quantity|
      if player_hash[color] > 0 
        count += [player_hash[color], quantity].min
      end
    end
    
    count -= get_exact_matches
  end

end