class Code

  attr_accessor :code

  COLORS = {
    "R" => :red,
    "O" => :orange,
    "Y" => :yellow,
    "G" => :green,
    "B" => :blue,
    "P" => :violet,
  }

  def self.valid_code?(pegs)
    pegs.all? {|peg| COLORS.include?(peg.upcase)}
  end

  def self.get_random_code(length)
    pegs = Array.new(length) { Code::COLORS.keys.sample }
    Code.new(pegs)
  end

  def initialize(pegs)
    if Code.valid_code?(pegs) && pegs.size == 4
      @code = pegs.map(&:upcase)
    else
      puts "Please choose four pegs from ROYGBP"
      @code = []
    end
  end

  def to_s
    @code.map { |peg| "\u2b24".colorize(COLORS[peg])}.join("   ")
  end

  def [](index)
    @code[index]
  end

  def get_hash
    hash = Hash.new(0)
    @code.each do |peg|
      hash[peg] += 1
    end
    hash
  end

end