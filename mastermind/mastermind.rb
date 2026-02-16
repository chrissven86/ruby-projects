#!/usr/bin/env ruby

def main
  loop do
    game = Game.new
    game.play

    display = Display.new
    display.ask_play_again
    break unless gets.chomp.downcase == 'y'
  end

  Display.new.show_goodbye
end

main if __FILE__ == $PROGRAM_NAME
