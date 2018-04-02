require 'game'

describe Game do

  let(:player_1) { double('Player 1', name: 'Jaime', symbol: 'X') }
  let(:player_2) { double('Player 2', name: 'Josu', symbol: 'O') }

  let(:fields) { double('TTT Fields', fields: {
    1 => '',
    2 => '',
    3 => '',
    4 => '',
    5 => '',
    6 => '',
    7 => '',
    8 => '',
    9 => '',
  }) }

  subject(:game) { described_class.new(player_1, player_2, fields) }

  describe "#initialize" do
    it "should initialize a game with 2 players and empty fields" do
      expect(game.player1.name).to eq 'Jaime'
      expect(game.player1.symbol).to eq 'X'

      expect(game.player2.name).to eq 'Josu'
      expect(game.player2.symbol).to eq 'O'

      expect(game.board.fields).to eq({
        1 => '',
        2 => '',
        3 => '',
        4 => '',
        5 => '',
        6 => '',
        7 => '',
        8 => '',
        9 => '',
      })
    end

    it "should set first turn for Player 1 automatically" do
      expect(game.current_turn).to eq player_1
    end
  end

  describe "#claim_field" do
    it "should allow player (current_turn) to claim an empty field" do
      # allow(game.board.fields).to receive(:[]).with(1).and_return('X')
      # allow(game.board.fields).to receive(:[]).with(1)
      # allow(game.board.fields).to receive(:[])

      game.claim_field(1)
      # expect(game.claim_field(1)).to eq 'X'

      expect(game.board.fields[1]).to eq 'X'
    end

    it "should raise an exception if field is taken" do
      # allow(game.board.fields).to receive(:[]).with(1).and_return('X')
      game.claim_field(1)

      expect{ game.claim_field(1) }.to raise_error "Field already claimed!"
    end

    it "should change turn automatically if claiming field is OK" do
      game.claim_field(1)

      expect(game.current_turn).to eq player_2
    end
  end

  # Should be part of the #claim_field describe block
  describe "#game_over?" do
    it "should declare a winner if there is one" do
      game.claim_field(1)
      game.claim_field(4)

      game.claim_field(2)
      game.claim_field(5)

      expect(game.claim_field(3)).to eq "#{player_1.name} wins!"
    end

    it "should declare another winner if he won" do
      game.claim_field(4)
      game.claim_field(1)

      game.claim_field(5)
      game.claim_field(2)

      game.claim_field(9)

      expect(game.claim_field(3)).to eq "#{player_2.name} wins!"
    end

    it "should declare draw if there is no winner" do
      game.claim_field(5)
      game.claim_field(4)

      game.claim_field(6)
      game.claim_field(7)

      game.claim_field(1)
      game.claim_field(9)

      game.claim_field(8)
      game.claim_field(2)

      expect(game.claim_field(3)).to eq "It's a draw!"
    end
  end
end
