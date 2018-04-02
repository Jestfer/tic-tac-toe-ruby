class Game
  attr_reader :player1, :player2, :board, :current_turn

  def initialize(player1, player2, fields)
    @player1 = player1
    @player2 = player2
    @board = fields
    @current_turn = player1
    @finished = false
  end

  def claim_field(num)
    legal?(num)

    @board.fields[num] = @current_turn.symbol

    game_over?
  end

  private

  def game_over?
    win_conditions
    @win_conditions.each do |condition|
      end_game if condition.all? { |val| val == 'X' }
      end_game if condition.all? { |val| val == 'O' }

      return "#{@current_turn.name} wins!" if condition.all? { |val| val == 'X' }
      return "#{@current_turn.name} wins!" if condition.all? { |val| val == 'O' }
    end

    return "It's a draw!" if draw?

    next_turn
  end

  def legal?(num)
    raise "Game is over!" if @finished == true
    raise "Field already claimed!" unless @board.fields[num].empty?
  end

  def next_turn
    @current_turn == player1 ? @current_turn = player2 : @current_turn = player1
  end

  def draw?
    end_game if !@board.fields.values.any? &:empty?
  end

  def end_game
    @finished = true
  end

  def win_conditions
    @win_conditions = [
      # Row 1
      [@board.fields[1], @board.fields[2], @board.fields[3]],
      # Row 2
      [@board.fields[4], @board.fields[5], @board.fields[6]],
      # Row 3
      [@board.fields[7], @board.fields[8], @board.fields[9]],
      # Column 1
      [@board.fields[1], @board.fields[4], @board.fields[7]],
      # Column 2
      [@board.fields[2], @board.fields[5], @board.fields[8]],
      # Column 3
      [@board.fields[3], @board.fields[6], @board.fields[9]],
      # Diagonal 1
      [@board.fields[1], @board.fields[5], @board.fields[9]],
      # Diagonal 2
      [@board.fields[3], @board.fields[5], @board.fields[7]],
    ]
  end
end
