require_relative '../lib/game'

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
  describe 'sending messages to other classes' do
    describe '#check_winner' do
      let(:wincheckclassdummy) { double :WinCheck }
      let(:wincheckinstancedummy) { double :@wincheck }
      let(:displayclassdummy) { double :Display }

      it 'sends message to wincheck class' do
        allow(wincheckclassdummy).to receive(:new).and_return(wincheckinstancedummy)
        allow(wincheckinstancedummy).to receive(:winner?)
        allow(displayclassdummy).to receive(:new)
        game = Game.new(wincheck = wincheckclassdummy, display = displayclassdummy)
        game.player_1_move("C1")
        expect(wincheckinstancedummy).to have_received(:winner?)
      end
    end
    describe '#show_board' do
      let(:wincheckclassdummy) { double :WinCheck }
      let(:displayclassdummy) { double :Display }
      let(:displayinstancedummy) { double :@display }

      it 'sends message to display class' do
        allow(displayclassdummy).to receive(:new).and_return(displayinstancedummy)
        allow(displayinstancedummy).to receive(:show)
        allow(wincheckclassdummy).to receive(:new)
        game = Game.new(wincheck = wincheckclassdummy, display = displayclassdummy)
        game.show_board
        expect(displayinstancedummy).to have_received(:show)
      end
    end
  end
  it 'declares a draw if there are no moves left' do
    game = Game.new
    game.player_1_move("A1")
    game.player_2_move("A2")
    game.player_1_move("A3")
    game.player_2_move("B2")
    game.player_1_move("B1")
    game.player_2_move("B3")
    game.player_1_move("C2")
    game.player_2_move("C1")
    expect(game.player_1_move("C3")).to eq("It's a draw")
  end
end