require_relative "computer"

FEEDBACK = {
  CORRECT_WRONG_POSITION: "Correct selection, wrong position",
  CORRECT_RIGHT_POSITION: "Correct selection, correct position",
  EMPTY_FEEDBACK: "Seems like you got everythin wrong..."
}

class Game
  attr_reader :list_of_feedback

  def initialize(player1, player2)
    @code = []
    @list_of_feedback = []
    @player1 = player1
    @player2 = player2
    
    player1.game = self if (player1.is_a? Computer) 
    player2.game = self if (player2.is_a? Computer) 
  end

  def start 
    puts "#{@player1.name} pick a code"
    @code = input_code(@player1)
    12.times do 
      if run_round(@player2) #run round returns true or false based on if the player correct guessed the code
        puts "#{@player2.name} won!"
        return
      end
    end
    puts "Out of attempts.. #{@player1.name} wins!"
  end

  def get_feedback(guesses)
   guesses.each_with_index.map do |guess, index|
      if @code.include? guess 
        @code[index] == guess ? FEEDBACK[:CORRECT_RIGHT_POSITION] : FEEDBACK[:CORRECT_WRONG_POSITION]
      end
    end.compact.shuffle
  end

  def display_feedback(list_of_feedback)
    if list_of_feedback.empty? 
      puts "#{player2.name} got everything wrong..."
    else
      puts list_of_feedback
    end
  end

  def is_valid_code(code_list)
    return { valid: false, error_message: "The code must be 4 digits long" } unless code_list.size == 4

    { valid: true, error_message: "" }
  end

  def is_guesser?(player)
    player == @player2
  end

  def input_code(player)
    loop do
      input = player.get_input.chars.map(&:to_i)
      code_check = is_valid_code(input)
      return input unless !code_check[:valid]
      puts code_check[:error_message] + ", try again:"
    rescue ArgumentError
      puts "Input must be numbers, try again:"
    end
  end
  
  def run_round(player) #run round returns true or false based on if the player correct guessed the code
    puts "#{player.name} please guess the color code"
    guess = input_code(player)
    @list_of_feedback = get_feedback(guess)
    display_feedback(@list_of_feedback) 
    @list_of_feedback.all? {|feedback| feedback == FEEDBACK[:CORRECT_RIGHT_POSITION]} && list_of_feedback.size == 4
  end


end