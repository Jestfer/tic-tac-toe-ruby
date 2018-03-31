class Game
  attr_reader :player1, :player2, :board, :current_turn

  def initialize(player1, player2, fields)
    @player1 = player1
    @player2 = player2
    @board = fields
    @current_turn = player1
  end

  def claim_field(num)
    field_empty?(num)
    @board.fields[num] = @current_turn.symbol
    next_turn

    @board.fields
  end

  private

  def field_empty?(num)
    raise "Field already claimed!" unless @board.fields[num].empty?
  end

  def next_turn
    @current_turn == player1 ? @current_turn = player2 : current_turn = player1
  end
end
