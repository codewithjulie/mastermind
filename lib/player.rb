class Player

  def initialize
    @name = "Player"
  end

  def get_guess
    print "Enter your guess: "
    @guess = gets.chomp
  end


end