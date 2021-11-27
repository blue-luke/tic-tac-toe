require_relative '../lib/board'

describe Game do
  describe 'placing pieces' do
    it 'lets player 1 enter an O' do
      game = Game.new
      board = [["O", " ", " "],[" ", " ", " "],[" ", " ", " "]]
      expect(game.player_1_move("A1")).to eq(board)
  end
    it 'lets player 1 enter two Os' do
      game = Game.new
      board = [["O", "O", " "],[" ", " ", " "],[" ", " ", " "]]
      game.player_1_move("A1")
      expect(game.player_1_move("B1")).to eq(board)
    end
    it 'lets player 2 enter an X' do
      game = Game.new
      board = [[" ", " ", "X"],[" ", " ", " "],[" ", " ", " "]]
      expect(game.player_2_move("C1")).to eq(board)
    end
  end
  describe 'edge cases' do
    it 'prevents you placing a piece where this is already a piece' do
      game = Game.new
      game.player_1_move("C1")
      expect { game.player_1_move("C1") }.to raise_error("There's already a piece there")
    end
    it 'checks input ranges between A1 and C3' do
      game = Game.new
      expect { game.player_1_move("D1") }.to raise_error("That's off the board")
    end
  end
  describe 'seeing if there is a winner' do
    let(:wincheckclassdummy) { double :WinCheck }
    let(:wincheckinstancedummy) { double :@wincheck}

    it 'checks to see if there is a winner' do
      allow(wincheckclassdummy).to receive(:new).and_return(wincheckinstancedummy)
      allow(wincheckinstancedummy).to receive(:winner?)
      game = Game.new(wincheck = wincheckclassdummy)
      game.player_1_move("C1")
      expect(wincheckinstancedummy).to have_received(:winner?)
    end
  end
# add in test for sending message to display
end