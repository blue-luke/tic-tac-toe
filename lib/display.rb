class Display
  def show(board)
    line1 = ("   |   |   " + "\n")
    line2 = (" " + "#{board[0][0]}" + " | " + "#{board[0][1]}" + " | " + "#{board[0][2]}" + " " + "\n")
    line3 = ("___|___|___" + "\n")
    line4 = ("   |   |   " + "\n")
    line5 = (" " + "#{board[1][0]}" + " | " + "#{board[1][1]}" + " | " + "#{board[1][2]}" + " " + "\n")
    line6 =("___|___|___" + "\n")
    line7 = ("   |   |   " + "\n")
    line8 = (" " + "#{board[2][0]}" + " | " + "#{board[2][1]}" + " | " + "#{board[2][2]}" + " " + "\n")
    line9 = ("   |   |   ")
    print(line1 + line2 + line3 + line4 + line5 + line6 + line7 + line8 + line9)
    return (line1 + line2 + line3 + line4 + line5 + line6 + line7 + line8 + line9)
  end
end