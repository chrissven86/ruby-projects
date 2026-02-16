#! usr/bin/env ruby
# Short test file to check all the various UI

require_relative 'display'

display = Display.new

display.show_welcome

display.show_mode_selection

display.show_turn(1, 12)

display.show_feedback(%w[R G B O], { exact: 4, color: 0 })
display.show_feedback(%w[R G B O], { exact: 0, color: 2 })
display.show_feedback(%w[R G B O], { exact: 0, color: 0 })
display.show_feedback(%w[R G B O], { exact: 2, color: 2 })

display.show_computer_guess(%w[R G B O])
display.show_computer_loose(%w[R G B O])
display.show_computer_win(8)

display.show_human_win(3)
display.show_human_loose(%w[R G B O])

display.show_game_start_computer
display.show_game_start_human

display.show_message('Random message')
display.show_prompt('Random prompt')
display.show_error('Random error')

display.ask_play_again

display.show_goodbye
