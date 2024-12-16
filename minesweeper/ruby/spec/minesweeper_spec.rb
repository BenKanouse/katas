# frozen_string_literal: true

require 'rspec'
require './minesweeper'

describe Minesweeper do
  let(:game) { Minesweeper.new(5, 5, 5) }

  describe "#initialize" do
    it "creates a board with the correct dimensions" do
      expect(game.instance_variable_get(:@board).size).to eq(5)
      expect(game.instance_variable_get(:@board).first.size).to eq(5)
    end

    it "places the correct number of mines" do
      mine_count = game.instance_variable_get(:@board).flatten.count(-1)
      expect(mine_count).to eq(5)
    end
  end

  describe "#reveal" do
    it "reveals a cell without a mine" do
      allow(Random).to receive(:rand)
        .and_return(0, 1, 0, 2, 0, 3, 0, 4, 1, 1) # Force mine locations

      expect(game.reveal(0, 0)).to eq("Revealed")
    end

    it "reveals a mine" do
      allow(Random).to receive(:rand)
        .and_return(0, 0, 0, 2, 0, 3, 0, 4, 1, 1) # Force mine locations

      expect(game.reveal(0, 0)).to eq("Boom!")
    end

    it "raises an error for invalid cells" do
      expect { game.reveal(6, 6) }.to raise_error("Invalid cell")
    end

    it "raises an error for already revealed cells" do
      game.reveal(0, 0)
      expect { game.reveal(0, 0) }.to raise_error("Cell already revealed")
    end
  end

  describe "#display" do
    it "displays the board" do
      game.reveal(0, 0)
      expect { puts game.display }.not_to raise_error
    end
  end
end
