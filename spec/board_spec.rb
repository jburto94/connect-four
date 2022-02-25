require_relative '../lib/board.rb'

describe Board do
  let(:blue_piece) { described_class.new.blue_piece }
  let(:red_piece) { described_class.new.red_piece }

  describe '#initialize' do
    subject(:new_game) { described_class.new }

    it "creates grid with 6 rows" do
      rows = new_game.grid.length
      expect(rows).to eq(6)
    end
  end
end