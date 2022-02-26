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
end