require_relative '../lib/win_check'

class Game
  def initialize
    @board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
    @column_map = { "A" => 0, "B" => 1, "C" => 2 }
    @row_map = { "1" => 0, "2" => 1, "3" => 2 }
    @pieces = { "Player 1" => "O", "Player 2" => "X"}
    @winner = nil
    @wincheck = WinCheck.new
    # @curent_player = 
  end

  def player_1_move(move)
    either_player_move(move, @pieces["Player 1"])
  end

  def player_2_move(move)
    either_player_move(move, @pieces["Player 2"])
  end

  def display
    line1 = ("   |   |   " + "\n")
    line2 = (" " + "#{@board[0][0]}" + " | " + "#{@board[0][1]}" + " | " + "#{@board[0][2]}" + " " + "\n")
    line3 = ("___|___|___" + "\n")
    line4 = ("   |   |   " + "\n")
    line5 = (" " + "#{@board[1][0]}" + " | " + "#{@board[1][1]}" + " | " + "#{@board[1][2]}" + " " + "\n")
    line6 =("___|___|___" + "\n")
    line7 = ("   |   |   " + "\n")
    line8 = (" " + "#{@board[2][0]}" + " | " + "#{@board[2][1]}" + " | " + "#{@board[2][2]}" + " " + "\n")
    line9 = ("   |   |   ")
    print(line1 + line2 + line3 + line4 + line5 + line6 + line7 + line8 + line9)
  end
  
  private

  def either_player_move(move, player_piece)
    check_move_possible(move)

    column = parse_column(move)
    row = parse_row(move)
    check_move_legal(column, row)

    make_move(column, row, player_piece)

    outcome_of_move(player_piece)
  end

  def check_move_possible(move)
    possible_moves = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    raise "That's off the board" unless possible_moves.include?(move)
  end

  def parse_column(move)
    column = @column_map.fetch(move[0], nil)
  end

  def parse_row(move)
    row = @row_map.fetch(move[1], nil)
  end

  def check_move_legal(column, row)
    raise "There's already a piece there" if @board[row][column] != " "
  end

  def make_move(column, row, player_piece)
    @board[row][column] = player_piece
  end

  def outcome_of_move(player_piece)
    check_winner(player_piece)
    @winner ? "#{@winner} is the winner!" : @board
  end

  def check_winner(player_piece)
    @wincheck.winner?(@board) ? ( @winner = @pieces.key(player_piece) ) : return 
  end
end