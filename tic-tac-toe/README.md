This is the first Ruby assignemnt within The Odin Project that has a bit more OOP to it compared to earlier projects.

Tic Tac Toe will be played through the command line by loading the main ruby-file. Two players against eachother.

The project is built up with a proper lib-structure with minimal coupling between the classes.

board.rb manage the board through a grid stored as an array, validates any moves and check against winning combinations,
player.rb manage the two human players, by storing names and wether they are X or O
game.rb manage turns, gets the player input and coordinates between board and player.