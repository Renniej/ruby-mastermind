require_relative "player"

  
=begin
https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind
The system I tend to use is suboptimal but very easy to follow. It goes as follows:

Start with 0000. You can never get picos if all digits are the same, only bagels.

If the secret number was 0187, then you will get one bagel and three fermis.

If the secret number was 2966, then you will get four fermis and you know that 0 is not in the secret number at all.

If there are any bagels with 0000, include that many 0's in your next answer, and replace the rest with 1's.

If the secret number was 0187, then you'd keep one of the 0's in your answer, and guess 0111 next, getting two bagels.

If the secret number was 2966, then you'd guess 1111 next, getting four fermis again.

Keep increasing the extra digits by 1. Those digits are "background digits", while the digits that you've kept the same should never change values and are "foreground digits".

However many more pegs there are when you change the background digits, that many background digits then become foreground digits.

Eventually you'll get to a point where you have a total of four pegs. If you have four bagels, congratulations, you have the right answer. But if some of them are picos, then some of them are in the wrong order. At this point, just try rearranging them, paying attention to whether your arrangement matches the number of switched digits in each of your previous guesses.
=end

class Computer < Player

  attr_accessor :game

  def initialize()
    super("Computer")
    @game = nil
    @guess_index = 0
    @choices = (1000..9999).map{|num| num}
    @choices.push(0000)
  end
  
  def filter_unviable_guesses(feedback_tally)
    @choices.select do |code|
      formattedCode = code.to_s.rjust(4, "0").chars.map(&:to_i)
      feedback =  @game.get_feedback(formattedCode)
      feedback.tally != feedback_tally
    end
  end

  def get_guess
    @choices = filter_unviable_guesses(@game.list_of_feedback.tally)
    guess = (@choices.include? 1112)  ? 1112 : @choices.sample
    @choices.delete(guess).to_s
  end
  
  def is_guesser? 
    game.is_guesser?(self)
  end

  def get_input
    code =  (is_guesser?) ? get_guess : @choices.delete(@choices.sample).to_s 
    puts code
    puts "king #{@choices}"
    code
  end


end