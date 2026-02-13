#!/usr/bin/env ruby

require_relative 'lib/board'

board = Board.new
puts 'Empty board:'
board.display

board.display_positions

puts 'some moves to check alignment'
board.update(1, 'X')
board.update(5, 'O')
board.update(9, 'X')
board.diplay
