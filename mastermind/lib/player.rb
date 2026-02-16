# This file handles all human and computer implementations

# Class creation for HumanPlayer
class HumanPlayer
  COLORS = %w[R G B Y O P].freeze
  CODE_LENGTH = 4

  def initialize
    @display = display
  end

  # make the guess and validate input
  def make_guess
    loop do
      @display.show_prompt('Enter your guess (e.g. R, G, B, Y): ')
      input = gets.chomp.upcase.split

      return input if valid_input?(input)

      @display.show_error("Invalid input! Use #{CODE_LENGTH} colors from #{COLORS.join(', ')}")
    end
  end

  # create the secret code and validate input
  def create_code
    @display.show_message("\nCreate your secret code!")
    loop do
      @display.show_prompt("Enter #{CODE_LENGTH} colors (e.g. R, G, B, Y): ")
      input = gets.chomp.upcase.split

      return input if valid_input?(input)

      @display.show_error("Invalid input! #{CODE_LENGTH} colors from #{COLORS.join(', ')}")
    end
  end

  # validate input towards code length and included colors
  def valid_input?(input)
    input.lenght == CODE_LENGTH && input.all? { |color| COLORS.include?(color) }
  end
end

# Class creation for computer player
class ComputerPlayer
  def initialize(colors, code_length)
    @colors = colors
    @code_length = code_length
    @possibilities = generate_all_possibilities
    @first_guess = true
  end

  def make_guess
    if @first_guess
      @first_guess = false
      [@colors[0], @colors[1], @colors[2], @colors[3]]
    elsif @possibilities.length == 1
      @possibilities.first
    else
      @possibilities.sample
    end
  end

  def process_feedback(guess, actual_feedback)
    @possibilities.select! do |possibility|
      simulated_feedback = calculate_feedback(possibility, guess)
      simulated_feedback == actual_feedback
    end
  end

  def generate_random_code
    @code_length.times.map { @colors.sample }
  end

  private

  def generate_all_possibilities
    @colors.repeated_permutation(@code_length).to_a
  end

  def calculate_feedback(secret, guess)
    exact = 0
    secret_copy = secret.dup
    guess_copy = guess.dup

    secret_copy.length.times do |i|
      next unless guess_copy[i] == secret_copy[i]

      exact += 1
      secret_copy[i] = nil
      guess_copy[i] = nil
    end

    color = 0
    guess_copy.compact.each do |c|
      if secret_copy.include?(c)
        color += 1
        secret_copy[secret_copy.index(c)] = nil
      end
    end

    { exact: exact, color: color }
  end
end
