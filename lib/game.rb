require_relative '../lib/win_check'
require_relative '../lib/display'

class Game
  def initialize(wincheck = WinCheck, display = Display)
    @board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
    @column_map = { "A" => 0, "B" => 1, "C" => 2 }
    @row_map = { "1" => 0, "2" => 1, "3" => 2 }
    @pieces = { "Player 1" => "O", "Player 2" => "X" }
    @winner = nil
    @draw = false
    @wincheck = wincheck.new
    @display = display.new
  end

  def player_1_move(move)
    raise "It's player 2's go" unless player_1s_go?
    either_player_move(move, @pieces["Player 1"])
  end

  def player_2_move(move)
    raise "It's player 1's go" unless player_2s_go?
    either_player_move(move, @pieces["Player 2"])
  end

  def show_board
    @display.show(@board)
  end

  private

  def player_1s_go?
    @board.flatten.count("O") == @board.flatten.count("X")
  end

  def player_2s_go?
    @board.flatten.count("O") == @board.flatten.count("X") + 1
  end

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
    check_draw
    if @winner
      "#{@winner} is the winner"
    elsif @draw
      "It's a draw"
    else
      return @board
    end
  end

  def check_winner(player_piece)
    @wincheck.winner?(@board) ? ( @winner = @pieces.key(player_piece) ) : return 
  end

  def check_draw
    !@board.flatten.include?(" ") ? @draw = true : return
  end
end