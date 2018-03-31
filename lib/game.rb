class Game
  attr_reader :player1, :player2, :fields

  def initialize(player1, player2, fields)
    @player1 = player1
    @player2 = player2
    @fields = fields
  end
end
