class Code

  attr_accessor :code

  COLORS = ["O", "W", "B", "R", "G", "Y"]

  def to_s
    @code.join(" ")
  end

  def self.valid_code?(pegs)
    pegs.all? {|peg| COLORS.include?(peg.upcase)}
  end

  def initialize(pegs)
    raise unless Code.valid_code?(pegs)
    @code = pegs.map(&:upcase)
  end



end