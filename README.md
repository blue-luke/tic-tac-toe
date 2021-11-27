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
> game.show_board
```

## Approach

I strictly TDD'd the start, having a behavioural test that I passed simply. After my 2nd test, I refactored. The focus at this point was on putting pieces on the board.

Next I needed to enable winning. The conditions for this are subtle and ugly. They were kept within the board class initially (renamed game), before being put in their own win_check class.

Another class was created for displaying the board in a more readable manner than the raw array. This was also a challenge but contributes greatly to the functionality of the code, given that it is a very visual game.

It was a challenge to double and stub the correct objects and methods to remove the dependency of the game class tests on other classes. However, the game class only has responsibility for sending a specific message, so the tests themselves are quite simple (see section 'sending messages to other classes' in /spec/game_spec.rb).

The game class has many initialised variables and is 70 lines long, which is not ideal, but I think all the methods belong there.

## Next steps

The code currently only reflects the rules of the game. It relies on the players knowing the interface method (the irb commands above) and taking it in turns, much like a real game. However, the next step could be to have a command line interface or web app that:
- Asks whether the players want to start a game
- Forces the players to alternate turns
- Show the board after every move
- Gets players to re-enter their moves if the moves are not possible
- Declares a winners
- Asks if players want to play another game

Further features could be:
- Let players choose who is O and who is X

##

A turn ends when a player claims a field
A game is over when all fields are taken