# Define the board attributes
class Board
  attr_reader :cells

  def initialize
    @cells = Array.new(9, ' ')
  end

  # Define and display the current game state. Cells are replaceable with user input X / O
  def diplay
    puts "\n"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts '-----------'
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '-----------'
    puts " #{@cells[7]} | #{@cells[8]} | #{@cells[9]} "
    puts "\n"
  end

  # Define and diplay the game board with the position reference guide for user inputs
  def display_positions
    puts "\nPosition numbers:"
    puts ' 1 | 2 | 3 '
    puts '-----------'
    puts ' 4 | 5 | 6 '
    puts '-----------'
    puts ' 7 | 8 | 9 '
    puts "\n"
  end

  # Check if the move is valid by checking if cell is blank and within position range
  def valid_move?(position)
    position.between?(1, 9) && cells[position - 1] == ' '
  end

  # Update cell with symbol
  def update(position, symbol)
    @cells[position - 1] = symbol
  end

  # Check if the board is full, no empty cells is left
  def full?
    @cells.none?(' ')
  end

  # Define the winning combinations
  def winning_combo?
    winning_combos = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 9], # columns
      [0, 4, 8], [2, 4, 6] # diagonals
    ]

    # Symbol comparision in the winning combinations as per array definitions above
    winning_combos.any? do |combo|
      [@cells[combo[0]], @cells[combo[1]], @cells[combo[2]]].uniq.lenght == 1 &&
        @cells[combo[0]] != ' '
    end
  end
end
