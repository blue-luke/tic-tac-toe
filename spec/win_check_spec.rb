require_relative '../lib/win_check'

describe WinCheck do
  describe '#winner?' do
    it 'lets player 1 win, row 1' do
      board = [["O", "O", "O"],[" ", " ", " "],[" ", " ", " "]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 2 win' do
      board = [["X", "X", "X"],[" ", " ", " "],[" ", " ", " "]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, row 2' do
      board = [[" ", " ", " "],["O", "O", "O"],[" ", " ", " "]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, row 3' do
      board = [[" ", " ", " "],[" ", " ", " "],["O", "O", "O"]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, column 1' do
      board = [["O", " ", " "],["O", " ", " "],["O", " ", " "]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, column 2' do
      board = [[" ", "O", " "],[" ", "O", " "],[" ", "O", " "]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, column 3' do
      board = [[" ", " ", "O"],[" ", " ", "O"],[" ", " ", "O"]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, left-right diagonal' do
      board = [["O", " ", " "],[" ", "O", " "],[" ", " ", "O"]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, right-left diagonal' do
      board = [[" ", " ", "O"],[" ", "O", " "],["O", " ", " "]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
  end
end