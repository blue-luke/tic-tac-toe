require_relative '../lib/board'

describe Game do
  describe 'placing pieces' do
    it 'lets player 1 enter an O' do
      game = Game.new
      board = [["O", nil, nil],[nil, nil, nil],[nil, nil, nil]]
      expect(game.player_1_move("A1")).to eq(board)
  end
    it 'lets player 1 enter two Os' do
      game = Game.new
      board = [["O", "O", nil],[nil, nil, nil],[nil, nil, nil]]
      game.player_1_move("A1")
      expect(game.player_1_move("B1")).to eq(board)
    end
    it 'lets player 2 enter an X' do
      game = Game.new
      board = [[nil, nil, "X"],[nil, nil, nil],[nil, nil, nil]]
      expect(game.player_2_move("C1")).to eq(board)
    end
  end
  describe 'winning' do
    it 'lets player 1 win, row 1' do
      game = Game.new
      game.player_1_move("A1")
      game.player_1_move("B1")
      expect(game.player_1_move("C1")).to eq("Player 1 is the winner!")
    end
    it 'lets player 2 win' do
      game = Game.new
      game.player_2_move("A1")
      game.player_2_move("B1")
      expect(game.player_2_move("C1")).to eq("Player 2 is the winner!")
    end
    it 'lets player 1 win, row 2' do
      game = Game.new
      game.player_1_move("A2")
      game.player_1_move("B2")
      expect(game.player_1_move("C2")).to eq("Player 1 is the winner!")
    end
    it 'lets player 1 win, row 3' do
      game = Game.new
      game.player_1_move("A3")
      game.player_1_move("B3")
      expect(game.player_1_move("C3")).to eq("Player 1 is the winner!")
    end
    it 'lets player 1 win, column 1' do
      game = Game.new
      game.player_1_move("A1")
      game.player_1_move("A2")
      expect(game.player_1_move("A3")).to eq("Player 1 is the winner!")
    end
    it 'lets player 1 win, column 2' do
      game = Game.new
      game.player_1_move("B1")
      game.player_1_move("B2")
      expect(game.player_1_move("B3")).to eq("Player 1 is the winner!")
    end
    it 'lets player 1 win, column 3' do
      game = Game.new
      game.player_1_move("C1")
      game.player_1_move("C2")
      expect(game.player_1_move("C3")).to eq("Player 1 is the winner!")
    end
    it 'lets player 1 win, left-right diagonal' do
      game = Game.new
      game.player_1_move("A1")
      game.player_1_move("B2")
      expect(game.player_1_move("C3")).to eq("Player 1 is the winner!")
    end
    it 'lets player 1 win, right-left diagonal' do
      game = Game.new
      game.player_1_move("C1")
      game.player_1_move("B2")
      expect(game.player_1_move("A3")).to eq("Player 1 is the winner!")
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
end