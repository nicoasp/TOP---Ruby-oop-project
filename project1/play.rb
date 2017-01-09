require './board.rb'
require './player.rb'

# Introduction to game
board = Board.new
puts "Player 1, enter your name please!"
name1 = gets.chomp
puts "Welcome #{name1}! You play with the 'X'"
player1 = Player.new(name1, "X")
sleep 1
puts "Player 2, enter your name please!"
name2 = gets.chomp
puts "Welcome #{name2}! You play with the 'O'"
player2 = Player.new(name2, "O")
sleep 1
active_player = player1

# Gameplay
until board.game_over?
	board.display_board
	choice = active_player.make_play
	unless choice = 
	board.update_board(choice, active_player.symbol)
	if board.game_won?
		board.display_board
		puts "#{active_player.name} has won! Congratulations!"
	elsif board.game_tied?
		board.display_board
		puts "The game is a tie! So you are both half-losers!"
	else
		if active_player == player1
			active_player = player2
		else
			active_player = player1
		end
	end
end


