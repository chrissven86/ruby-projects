The second assignemnt in The Odin Project covering OOP styled Ruby-projects. This on is the classic game Mastermind.

I have not really played Mastermind before this assignment, so quite some time have been spent in reading up on rules and the idea behind the gameplay, so I can do some sort of replica in this version of Mastermind.

I have used the same file structure as for the Tic Tac Toe-game where all files are kept separated in the lib-folder, with the main mastermind.rb have very little coupling to the actual game files.

board.rb - Tracks the secret code, current turn and game status. It also determines the win conditions and game logic.
diplay.rb - Contains all the UI.
game.rb - Coordinates the game.
player.rb - Contains the Player- and Computer-logic.

Start the game through ruby mastermind.rb