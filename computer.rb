require_relative "player"

class Computer < Player

  attr_accessor :game

  def initialize()
    super("Computer")
    @game = nil
    @choices = (1000..9999).select { |num| num.to_s.chars.uniq.length == 4 }
  end
  
  

  def get_guess
    
  end

  def get_input
    code = @choices.delete(@choices.sample).to_s
    puts code
    code
  end


end