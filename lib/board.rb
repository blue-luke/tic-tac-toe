class Game
  def initialize
    @board = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    @column_map = { "A" => 0, "B" => 1, "C" => 2 }
    @row_map = { "1" => 0, "2" => 1, "3" => 2 }
    @pieces = { "Player 1" => "O", "Player 2" => "X"}
    # @Player 1 = "O"
    # @Player 2 = "X"
    @winner = nil
  end

  def player_1_move(move)
    either_player_move(move, @pieces["Player 1"])
  end

  def player_2_move(move)
    either_player_move(move, @pieces["Player 2"])
  end

  private

  def either_player_move(move, player_piece)
    column = parse_column(move)
    row = parse_row(move)
    @board[row][column] = player_piece
    outcome_of_move(player_piece)
  end

  def outcome_of_move(player_piece)
    check_winner(player_piece)
    @winner ? "#{@winner} is the winner!" : @board
  end

  def parse_column(move)
    column = @column_map[move[0]]
  end

  def parse_row(move)
    row = @row_map[move[1]]
  end

  def check_winner(player_piece)
    if ( 
        ( @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2] && @board[0][0] != nil ) ||
        ( @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2] && @board[1][0] != nil ) ||
        ( @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2] && @board[2][0] != nil ) ||
        ( @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0] && @board[0][0] != nil ) ||
        ( @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1] && @board[0][1] != nil ) ||
        ( @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2] && @board[0][2] != nil ) ||
        ( @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != nil ) ||
        ( @board[2][0] == @board[1][1] && @board[1][1] == @board[0][2] && @board[2][0] != nil )
      )
      @winner = @pieces.key(player_piece)
    else
      return
    end
  end
end