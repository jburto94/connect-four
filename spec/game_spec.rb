require_relative '../lib/game.rb'

describe Game do
  let(:game) { described_class.new }

  describe "#valid_name?" do
    it "is valid when name is between 1 and 25 characters" do
      valid_name = "test"
      result = game.valid_name?(valid_name)
      expect(result).to be true
    end

    it "is not valid when name is less than 1 character" do
      invalid_name = ""
      result = game.valid_name?(invalid_name)
      expect(result).to be false
    end

    it "is not valid when name is greater than 25 characters" do
      invalid_name = "abcdefghijklmnopqrstuvwxyz"
      result = game.valid_name?(invalid_name)
      expect(result).to be false
    end
  end

  describe "#valid_turn?" do
    it "is valid when input is between 1 & 7 and not a filled column" do
      input = "2"
      result = game.valid_turn?(input)
      expect(result).to be true
    end

    it "is not valid if input is not a number" do
      input = "a"
      result = game.valid_turn?(input)
      expect(result).to be false
    end

    it "is not valid when input is less than 1" do
      input = "0"
      result = game.valid_turn?(input)
      expect(result).to be false
    end

    it "is not valid when input is greater than 7" do
      input = "8"
      result = game.valid_turn?(input)
      expect(result).to be false
    end

    it "is not valid when column is already full" do
      board = game.board
      first_column = 0
      (6).times { board.update_board(first_column, :red_piece) }
      result = game.valid_turn?("1")
      expect(result).to be false
    end
  end
end