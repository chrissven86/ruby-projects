require_relative 'board'
require_relative 'player'

# Define the game class and initialize board and player
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

  # Get player names
  def setup_players
    print 'Player 1 - Enter your name: '
    name1 = gets.chomp

    print 'Player 2 - Enter your name: '
    name2 = gets.chomp

    # Randomly assign X and O
    symbols = %w[X O].shuffle
    @players << Player.new(name1, symbols[0])
    @players << Player.new(name2, symbols[1])

    puts "\n#{@players[0].name} is #{@players[0].symbol}"
    puts "#{@players[1].name} is #{@players[1].symbol}"
  end

  # Start the game and get moves until either it's a win or a full board
  def play_game
    loop do
      @board.display
      current_player = @players[@current_player_index]

      position = get_player_move(current_player)
      @board.update(position, current_player.symbol)
      @board.display_positions
      @board.diplay

      if @board.winning_combo?
        @board.display
        puts "WOOHOO! #{current_player.name}, You win!"
        break
      elsif @board.full?
        @board.display
        puts "It's a tie!"
        break
      end

      switch_player
    end

    play_again?
  end

  def get_player_move(player)
    loop do
      print "#{player.name} (#{player.symbol}), enter your move (1-9): "
      input = gets.chomp

      unless input.match?(/^\d+$/)
        puts 'Please enter a number between 1 and 9.'
        next
      end

      position = input.to_i

      return position if @board.valid_move?(position)

      puts 'Invalid move! That position is either taken or out of range.'
    end
  end

  def switch_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def play_again?
    print "\nWould you like another round? (y/n): "
    answer = gets.chomp.downcase

    if answer == 'y'
      @board = Board.new
      @current_player_index = 0
      play_game
    else
      puts 'See you soon!'
    end
  end
end
