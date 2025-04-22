class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end
  

  def get_input
     gets.chomp
  end
end