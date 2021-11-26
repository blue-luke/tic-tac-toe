require_relative '../lib/win_check'

describe WinCheck do
  describe '#winner?' do
    it 'lets player 1 win, row 1' do
      board = [["O", "O", "O"],[nil, nil, nil],[nil, nil, nil]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 2 win' do
      board = [["X", "X", "X"],[nil, nil, nil],[nil, nil, nil]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, row 2' do
      board = [[nil, nil, nil],["O", "O", "O"],[nil, nil, nil]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, row 3' do
      board = [[nil, nil, nil],[nil, nil, nil],["O", "O", "O"]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, column 1' do
      board = [["O", nil, nil],["O", nil, nil],["O", nil, nil]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, column 2' do
      board = [[nil, "O", nil],[nil, "O", nil],[nil, "O", nil]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, column 3' do
      board = [[nil, nil, "O"],[nil, nil, "O"],[nil, nil, "O"]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, left-right diagonal' do
      board = [["O", nil, nil],[nil, "O", nil],[nil, nil, "O"]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
    it 'lets player 1 win, right-left diagonal' do
      board = [[nil, nil, "O"],[nil, "O", nil],["O", nil, nil]]
      wincheck = WinCheck.new
      expect(wincheck.winner?(board)).to eq(true)
    end
  end
end