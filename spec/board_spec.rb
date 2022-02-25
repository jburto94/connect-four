require_relative '../lib/board.rb'

describe Board do
  let(:blue_piece) { described_class.new.blue_piece }
  let(:red_piece) { described_class.new.red_piece }
  let(:empty_piece) { described_class.new.empty_piece }

  describe '#initialize' do
    subject(:new_board) { described_class.new }

    it "creates grid with 6 rows" do
      rows = new_board.grid.length
      expect(rows).to eq(6)
    end

    it "has rows with 7 columns each" do
      first_row_columns = new_board.grid[0].length
      expect(first_row_columns).to eq(7)
    end
  end

  describe "#update_board" do
    subject(:board) { described_class.new }

    it "should add red piece to first column" do
      first_column = 0
      board.update_board(first_column, red_piece)
      bottom_left_slot = board.grid[5][0]
      expect(bottom_left_slot).to eql(red_piece)
    end

    it "should add a piece on top of an already placed piece" do
      first_column = 0
      board.update_board(first_column, red_piece)
      board.update_board(first_column, blue_piece)
      stacked_slot = board.grid[4][0]
      expect(stacked_slot).to eql(blue_piece)
    end

    it "should not overwrite a piece on a filled column" do
      first_column = 0
      (6).times do
        board.update_board(first_column, red_piece)
      end

      board.update_board(first_column, blue_piece)
      top_left_slot = board.grid[0][0]
      expect(top_left_slot).to eql(red_piece)
    end

    it "should return false if column is already filled" do
      first_column = 0
      (6).times do
        board.update_board(first_column, red_piece)
      end

      invalid_update = board.update_board(first_column, red_piece)
      expect(invalid_update).to be false
    end
  end

  describe "#column_full?" do
    subject(:new_board) { described_class.new }

    it "should return false when column is not full" do
      first_column = 0
      result = new_board.column_full?(first_column)
      expect(result).to be false
    end

    it "should return true when column is full" do
      first_column = 0
      6.times { new_board.update_board(first_column, blue_piece) }
      result = new_board.column_full?(first_column)
      expect(result).to be true
    end
  end
end