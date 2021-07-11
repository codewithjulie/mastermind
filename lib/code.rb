class Code

  attr_accessor :code

  COLORS = {
    "O" => "orange",
    "Y" => "yellow",
    "B" => "blue",
    "G" => "green",
    "R" => "red",
    "W" => "white",
  }

  def self.valid_code?(pegs)
    pegs.all? {|peg| COLORS.include?(peg.upcase)}
  end

  def initialize(pegs)
    if Code.valid_code?(pegs) && pegs.size == 4
      @code = pegs.map(&:upcase)
    else
      puts "Please choose four pegs from Orange, Yellow, Blue, Green, Red, or White"
      @code = []
    end
  end

  def to_s
    @code.join(" ")
  end


end