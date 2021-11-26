class Game
  def initialize
    @board = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    @column_map = { "A" => 0, "B" => 1, "C" => 2 }
    @row_map = { "1" => 0, "2" => 1, "3" => 2 }
  end

  def player_1_move(move)
    column = parse_column(move)
    row = parse_row(move)
    @board[row][column] = "O"
    return @board
  end

  def parse_column(move)
    column = @column_map[move[0]]
  end

  def parse_row(move)
    row = @row_map[move[1]]
  end
end