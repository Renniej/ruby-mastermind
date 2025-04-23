require_relative "player"

class Computer < Player

  attr_accessor :game

  def initialize()
    super("Computer")
    @game = nil
    @choices = (1000..9999).select { |num| num.to_s.chars.uniq.length == 4 }
  end
  

  def get_guess
    @choices.delete(@choices.sample).to_s
  end

  def is_guesser? 
    game.is_guesser?(self)
  end
  
  def get_input
    code = if is_guesser? then get_guess else @choices.delete(@choices.sample).to_s end
    puts code
    code
  end


end