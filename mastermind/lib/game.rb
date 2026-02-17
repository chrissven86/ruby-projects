# Main game composer, let's go

require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game
  COLORS = %w[R G B Y O P].freeze
  CODE_LENGTH = 4
  MAX_TURNS = 12

  def initialize
    @display = Display.new
  end

  def play
    @display.show_welcome
    mode = get_mode

    if mode == 1
      play_human_guesses
    else
      play_computer_guesses
    end
  end

  private

  def get_mode
    @display.show_mode_selection
    loop do
      choice = gets.chomp.to_i
      return choice if [1, 2].include?(choice)

      @display.show_prompt('Invalid entry! Enter 1 or 2: ')
    end
  end

  def play_human_guesses
    computer = ComputerPlayer.new(COLORS, CODE_LENGTH)
    secret_code = computer.generate_random_code
    board = Board.new(secret_code, MAX_TURNS)
    human = HumanPlayer.new(@display)

    @display.show_game_start_human

    until board.game_over? || !board.turns_remaining?
      board.next_turn
      @display.show_turn(board.current_turn, board.max_turns)

      guess = human.make_guess
      feedback = board.calculate_feedback(guess)
      @display.show_feedback(guess, feedback)

      if board.winning_guess?(feedback)
        @display.show_human_win(board.current_turn)
        board.end_game
      end
    end

    @display.show_human_loose(board.secret_code) unless board.game_over?
  end

  def play_computer_guesses
    human = HumanPlayer.new(@display)
    secret_code = human.create_code
    board = Board.new(secret_code, MAX_TURNS)
    computer = ComputerPlayer.new(COLORS, CODE_LENGTH)

    @display.show_game_start_computer

    until board.game_over? || !board.turns_remaining?
      board.next_turn
      @display.show_turn(board.current_turn, board.max_turns)

      guess = computer.make_guess
      @display.show_feedback(guess, feedback)

      computer.process_feedback(guess, feedback)

      if board.winning_guess?(feedback)
        @display.show_computer_win(board.current_turn)
        board.end_game
      end

      sleep(1.5) unless board.game_over?
    end

    @display.show_computer_loose(board.secret_code) unless board.game_over?
  end
end
