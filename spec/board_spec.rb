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
end