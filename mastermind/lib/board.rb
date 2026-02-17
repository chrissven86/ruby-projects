# This file manage game state and feedback calculations

class Board
  attr_reader :secret_code, :current_turn, :max_turns, :game_over

  def initialize(secret_code, max_turns = 12)
    @secret_code = secret_code
    @max_turns = max_turns
    @current_turn = 0
    @game_over = false
  end

  def next_turn
    @current_turn += 1
  end

  def turns_remaining?
    @current_turn < @max_turns
  end

  def end_game
    @game_over = true
  end

  def calculate_feedback(guess)
    exact_match = 0
    secret_copy = @secret_code.dup
    guess_copy = @guess_copy.dup

    # Exact match
    secret_copy.length.times do |i|
      next unless guess_copy[i] == secret_copy[i]

      exact_match += 1
      secret_copy[i] = nil
      guess_copy[i] = nil
    end

    # Color match
    color_matches = 0
    guess_copy.compact.each do |color|
      if secret_copy.include?(color)
        color_matches += 1
        secret_copy[secret_copy.index(color)] = nil
      end
    end

    { exact: exact_match, color: color_matches }
  end

  def winning_guess?(feedback)
    feedback[:exact] == @secret_code.length
  end
end
