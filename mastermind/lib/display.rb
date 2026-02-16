# This file handes all user interface display

class Display
  def show_welcome
    puts "\n" + ('=' * 50)
    puts 'WELCOME TO MASTERMIND'.center(50)
    puts '=' * 50
    puts "\nColors: R, G, B, Y, O, P"
    puts 'Code lenght: 4 colors'
    puts 'Turns: 12 maximum'
    puts "\nFeedback:"
    puts ' ● = Right color, right position'
    puts ' ○ = Right color, wrong position'
    puts "\n" + ('=' * 50)
  end

  def show_mode_selection
    puts "\nChoose your mode:"
    puts '1. Guess the computers code'
    puts '2. Create a code for the computer to guess'
    print "\nEnter 1 or 2: "
  end

  def show_turn(current, max)
    puts "\nTurn #{current}/#{max}"
  end

  def show_feedback(guess, feedback)
    pegs = ('●' * feedback[:exact]) + ('○' * feedback[:color])
    puts "Guess: #{guess.join(' ')}"
    puts "Feedback: #{pegs.empty? ? '(none)' : pegs}"
    puts '=' * 30
  end

  def show_computer_guess(guess)
    puts "Computer guesses: #{guess.join(' ')}"
  end

  def show_human_win(turns)
    puts "\nYou cracked the code in #{turns} turns! Congrats!"
  end

  def show_human_loose(secret)
    puts "\nGame over! You failed to crack the code. The code was #{secret.join(' ')}"
  end

  def show_computer_win(turns)
    puts "\nThe computer cracked you code in #{turns} turns!"
  end

  def show_computer_loose(secret)
    puts "\nYou win! The computer could not crack the secret code: #{secret.join(' ')}"
  end

  def show_game_start_human
    puts "\nThe computer created a secret code"
    puts "Try to crack it!\n"
  end

  def show_game_start_computer
    puts "\nThe computer will now try to crack your code!\n"
  end

  def show_message(message)
    puts message
  end

  def show_prompt(prompt)
    print prompt
  end

  def show_error(error)
    puts error
  end

  def ask_play_again
    print "\nPlay again? (y/n): "
  end

  def show_goodbye
    puts "\nThanks for playing! See ya later!"
  end
end
