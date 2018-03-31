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
      allow(game.board.fields).to receive(:[]).with(1).and_return('X')
      # allow(game.board.fields).to receive(:[]).with(1)
      # allow(game.board.fields).to receive(:[])

      game.claim_field(1)
      # expect(game.claim_field(1)).to eq 'X'
      #p game.board.fields
      
      expect(game.board.fields[1]).to eq 'X'
    end
  end
end
