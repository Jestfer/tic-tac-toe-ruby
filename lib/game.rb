class Game
  attr_reader :player1, :player2, :fields, :current_turn

  def initialize(player1, player2, fields)
    @player1 = player1
    @player2 = player2
    @fields = fields
    @current_turn = player1.name
  end
end
