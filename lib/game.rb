class Game
  attr_reader :player1, :player2, :board, :current_turn

  def initialize(player1, player2, fields)
    @player1 = player1
    @player2 = player2
    @board = fields
    @current_turn = player1
  end

  def claim_field(num)
    @board.fields[num] = @current_turn.symbol
  end
end
