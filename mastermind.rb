#Player 1 picks a random set of colors (secret code)
# Loop 12 times
#   Player 2 submits a guess 
#   If guess is correct end the game and break the loop
#   Player 1 submits feedback
#   
# Player(name)
#   input() : number
#       gets.to_i
#   
#
# ENUM Feedback 
#   CORRECT_WRONG_POSITION = "Correct number, wrong position"
#   CORRECT_RIGHT_POSITION = "Correct number, correct position"
#   
#game(player1, player2)
#

#     
# get_feedback(guess : number[])
#   create variable called list_of_feedback with initial value of []
#   for each number in guess compare
#       if the number exist in the array and guess[i] == code[i]
#           push CORRECT_RIGHT_POSITION into list_of_feedback
#       else if number exist in the array but guess[i] != code[i]
#           push CORRECT_WRONG_POSITION into the array
#       end
#    end
#    return list_of_feedback.randomize the order
#  end
#  
#
# start()
#   output player1.name. pick a code (have input be blocked with ****)
#   game.code = player1.input().split split into an array of 4 numbers
#   Loop 12 times
#     output player2.name, please guess a color
#     create variable of type array named guess with the initial values of player2.inputColors().split() into array of 4 numbers
#     create variable called feedback =  get_feedback(guess)
#     
#     if feedback is the size of 4 and each element is of value CORRECT_RIGHT_POSITION
#       output player1.name WON!
#     else if 12th loop
#       output "Out of attempts.. player_2.name wins!"
#     else if feedback is empty
#       output "seems like you got everything wrong...."
#     else 
#       output feedback
#      end
#    end   
#
#     
#     

FEEDBACK = {
  CORRECT_WRONG_POSITION: "Correct selection, wrong position",
  CORRECT_RIGHT_POSITION: "Correct selection, correct position",
  EMPTY_FEEDBACK: "Seems like you got everythin wrong..."
}

class Game
  def initialize(player1, player2)
    @code = []
    @player1 = player1
    @player2 = player2
  end



  def get_feedback(guesses)
   guesses.each_with_index.map do |guess, index|
      if @code.includes? guess 
        @code[index] == guess ? FEEDBACK.CORRECT_RIGHT_POSITION : FEEDBACK.CORRECT_WRONG_POSITION
      end
    end.compact.shuffle
  end


  # start()
#   output player1.name. pick a code (have input be blocked with ****)
#   game.code = player1.input().split split into an array of 4 numbers
#   Loop 12 times
#     output player2.name, please guess a color
#     create variable of type array named guess with the initial values of player2.inputColors().split() into array of 4 numbers
#     create variable called feedback =  get_feedback(guess)
#     
#     if feedback is the size of 4 and each element is of value CORRECT_RIGHT_POSITION
#       output player1.name WON!
#     else if 12th loop
#       output "Out of attempts.. player_2.name wins!"
#     else if feedback is empty
#       output "seems like you got everything wrong...."
#     else 
#       output feedback
#      end
#    end   

  def start 
    puts "#{player1.name} pick a code"
    @code = player1.input.split.map(&:to_i)
     
    12.times do |attempt|
      puts "#{player2.name} please guess the 4 color code"
      guesses = player2.input.split.map(&:to_i)
      feedback = get_feedback(guesses)
      player2_won =  feedback.all? {& == FEEDBACK.CORRECT_RIGHT_POSITION} && feedback.size == 
      
      if player2_won 
        puts "#{player2.name} won!"
        break;
      elsif feedback.empty? 
        puts "#{player2.name} got everything wrong..."
      elsif attempt == 12  
         puts "Out of attempts.. #{player1.name} wins!"
      else
        puts feedback
      end
        

   
    end
    
  end
end