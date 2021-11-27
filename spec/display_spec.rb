require_relative '../lib/display'



describe Display do
  it 'displays a board correctly' do
    display = Display.new

    board = [["O", " ", " "],[" ", " ", " "],[" ", " ", " "]]
    
    line1 = ("   |   |   " + "\n")
    line2 = (" " + "O" + " | " + " " + " | " + " " + " " + "\n")
    line3 = ("___|___|___" + "\n")
    line4 = ("   |   |   " + "\n")
    line5 = (" " + " " + " | " + " " + " | " + " " + " " + "\n")
    line6 = ("___|___|___" + "\n")
    line7 = ("   |   |   " + "\n")
    line8 = (" " + " " + " | " + " " + " | " + " " + " " + "\n")
    line9 = ("   |   |   ")
    display_output = line1 + line2 + line3 + line4 + line5 + line6 + line7 + line8 + line9

    expect(display.show(board)).to eq(display_output)
  end
end