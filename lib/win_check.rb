class WinCheck

  def winner?(board)
    row_winner?(board) || column_winner?(board) || diagonal_winner?(board)
  end

  def row_winner?(board)
    (
    ( board[0][0] != nil && board[0][0] == board[0][1] && board[0][1] == board[0][2] ) ||
    ( board[1][0] != nil && board[1][0] == board[1][1] && board[1][1] == board[1][2] ) ||
    ( board[2][0] != nil && board[2][0] == board[2][1] && board[2][1] == board[2][2] )
    )
  end

  def column_winner?(board)
    (
    ( board[0][0] != nil && board[0][0] == board[1][0] && board[1][0] == board[2][0] ) ||
    ( board[0][1] != nil && board[0][1] == board[1][1] && board[1][1] == board[2][1] ) ||
    ( board[0][2] != nil && board[0][2] == board[1][2] && board[1][2] == board[2][2] )
    )
  end

  def diagonal_winner?(board)
    (
    ( board[0][0] != nil && board[0][0] == board[1][1] && board[1][1] == board[2][2] ) ||
    ( board[2][0] != nil && board[2][0] == board[1][1] && board[1][1] == board[0][2] )
    )
  end

end







      # ( board[0][0] != nil && board[0][0] == board[0][1] && board[0][1] == board[0][2] ) ||
      # ( board[1][0] != nil && board[1][0] == board[1][1] && board[1][1] == board[1][2] ) ||
      # ( board[2][0] != nil && board[2][0] == board[2][1] && board[2][1] == board[2][2] ) ||

      # ( board[0][0] != nil && board[0][0] == board[1][0] && board[1][0] == board[2][0] ) ||
      # ( board[0][1] != nil && board[0][1] == board[1][1] && board[1][1] == board[2][1] ) ||
      # ( board[0][2] != nil && board[0][2] == board[1][2] && board[1][2] == board[2][2] ) ||

      # ( board[0][0] != nil && board[0][0] == board[1][1] && board[1][1] == board[2][2] ) ||
      # ( board[2][0] != nil && board[2][0] == board[1][1] && board[1][1] == board[0][2] )