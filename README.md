# Tic Tac Toe

## How to use

See video demo at https://youtu.be/7KdYhnwNKhQ

Or:
- Download code and install rspec
- Run rspec to see automated tests passing
- Require './game' in a repl such as irb
- Play a game. The only possible moves are A1 to C3, where the letter is the column and the number is the row:
```
$ irb
> require './game'
> game = Game.new
> game.player_1_move("A1")
> game.player_2_move("B2")
> game.player_2_move("C3") # raising an error
> game.show_board
```

## Approach

I strictly TDD'd the start, having a behavioural test that I passed simply. After my 2nd test, I refactored. The focus at this point was on putting pieces on the board.

Next I needed to enable winning. The conditions for this are ugly. They were kept within the board class initially (renamed game), before being put in their own win_check class.

Another class (display) was created for displaying the board in a more readable manner than the raw array. This was also a challenge but contributes greatly to the functionality of the code, given that it is a very visual game.

I doubled and stubbed the correct objects and methods to remove the dependency of the game class tests on display class and win_check class. The game class only has responsibility for sending a specific message, so the tests themselves are quite simple (see section 'sending messages to other classes' in /spec/game_spec.rb).

The game class has many initialised variables and is over 70 lines long, which is not ideal, but I think all the methods belong there.

The game class also enforces player 1 going first and then alternating with player 2, announces a winner, announces a draw.

## Next steps

The code currently only reflects the rules of the game. It relies on the players knowing the interface method (the irb commands above). However, the next step could be to have a command line interface or web app that:
- Asks whether the players want to start a game
- Asks who wants to go first
- Shows the board after every move
- Gets players to re-enter their moves if the moves are not possible
- Declares a winner or a draw
- Asks if players want to play another game
- Keeps score across several games
