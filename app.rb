require_relative "mastermind"
require_relative "player"
require_relative "computer"

def input_player
  puts "What's your name?"
  Player.new(gets.chomp)
end

def input_game_mode 
  loop do
   puts "Would you like to be 'guesser' or 'encoder'"
   game_mode = gets.chomp.downcase
   return game_mode if (game_mode == "guesser" || game_mode == "encoder") 
   puts "Incorrect option"
  end
end

def get_players() 
  player = input_player()
  game_mode = input_game_mode
  return [Computer.new, player] if game_mode == "guesser"
  return [player, Computer.new] if game_mode == "encoder"
end

  


def main 
  player_1, player_2 = get_players
  game = Game.new(player_1, player_2)
  game.start
end

main