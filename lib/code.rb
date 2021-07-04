class Code

  attr_accessor :code

  def initialize(pegs)
    @code = pegs
  end

  def to_s
    @code.join(" ")
  end

end