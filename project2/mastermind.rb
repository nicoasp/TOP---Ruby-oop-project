require './code.rb'
require './player.rb'
require './game.rb'
require './game_computer.rb'


def game_choice
	puts 'Write "B" if you want to be the code Breaker, \
or "M" if you want to be the code Master'
	choice = gets.chomp.upcase
	case choice
	when "B"
		$game = Game.new
	when "M"
		$game = GameComputer.new
	else
		puts "Wrong input"
		game_choice
	end
end

puts 'Welcome to Mastermind!' 
sleep 3

game_choice

$game.gameplay

