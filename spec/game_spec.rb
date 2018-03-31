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

      expect(game.fields.fields).to eq({
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
  end
end
