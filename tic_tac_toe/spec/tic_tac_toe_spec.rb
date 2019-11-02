require "./lib/tic_tac_toe.rb"

RSpec.describe Board do

  describe "#check_board" do
    it "retuns true, if top row is Xs" do
      board = Board.new
      board.positions[0] = "x"
      board.positions[1] = "x"
      board.positions[2] = "x"
      board.turns_played = 6
      expect(board.check_board).to eql(true)
    end
    it "retuns nil, if no one has won yet" do
      board = Board.new
      board.positions[0] = "x"
      board.positions[1] = "x"
      board.positions[2] = "o"
      board.turns_played = 6
      expect(board.check_board).to eql(nil)
    end
    it "retuns false, if less than 5 turns has been played" do
      board = Board.new
      board.turns_played = 4
      expect(board.check_board).to eql(false)
    end
  end

  describe "#choose_position" do
    it "puts correct mark in correct position" do
      board = Board.new
      board.player = "x"
      board.choose_position(3)
      expect(board.positions[2]).to eql("x")
    end
  end

  describe "#input_ok?" do
    it "returns true, if position is not taken" do
      board = Board.new
      expect(board.input_ok?("3")).to eql(true)
    end
    it "returns nil, if position is taken" do
      board = Board.new
      board.positions[2] = "x"
      expect(board.input_ok?("3")).to eql(nil)
    end
  end

end