require_relative "mastermind"
require_relative "player"

def main 
  player_1 = Player.new("Jake")
  player_2 = Player.new("George")
  game = Game.new(player_1, player_2)
  game.start
end

main