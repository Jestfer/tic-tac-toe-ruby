require 'field'

describe Field do
  subject(:ttt_fields) { described_class.new }

  describe "#initialize" do
    it "should initialize with 9 empty fields" do
      expect(ttt_fields.fields).to eq(
        {
          1 => '',
          2 => '',
          3 => '',
          4 => '',
          5 => '',
          6 => '',
          7 => '',
          8 => '',
          9 => ''
        }
      )
    end
  end
end
