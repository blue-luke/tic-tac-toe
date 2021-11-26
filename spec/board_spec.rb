require_relative '../lib/board'

describe Game do
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
    it 'lets player 1 win' do
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
end