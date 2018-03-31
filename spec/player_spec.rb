require 'player'

describe Player do
  let(:player_1) { Player.new('Jaime', 'X') }
  let(:player_2) { Player.new('Josu', 'O') }

  describe "#initialize" do
    it "should initialize players with a name and a symbol" do
      expect(player_1.name).to eq 'Jaime'
      expect(player_1.symbol).to eq 'X'
      
      expect(player_2.name).to eq 'Josu'
      expect(player_2.symbol).to eq 'O'
    end
  end
end
