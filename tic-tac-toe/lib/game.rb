require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @players = []
    @current_player_index = 0
  end

  def start
    puts 'Welcome to a game of Tic-Tac-Toe!'
    setup_players
    @board.display_positions
    play_game
  end

  private

  def setup_players
    print 'Player 1 - Enter name: '
    name1 = gets.chomp

    print 'Player 2 - Enter name: '
    name2 = gets.chomp

    symbols = %w[X O].shuffle
    @players << Player.new(name1, symbols[0])
    @players << Player.new(name2, sumbols[1])

    puts "\n#{@players[0].name} is #{players[0].symbol}"
    puts "\n#{@players[1].name} is #{players[1].symbol}"
  end

  def play_game
    loop do
      @board.diplay
      current_player = @players[@current_player_index]

      position = get_player_move(current_player)
      @board.update(position, current_player.symbol)

      if @board.winning_combo?
        @board.diplay
        puts "WOOHOO!! Congrats #{current_player.name}! You win!"
        break
      elsif @board.full?
        @board.diplay
        puts "It's a tie!"
        break
      end

      switch_player
    end

    play_again?
  end
end
