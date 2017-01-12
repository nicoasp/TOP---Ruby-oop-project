require './code.rb'
require './player.rb'

class GameComputer


	def initialize
		@player = Player.new
		@solution_code = Code.new
		@solution_code.code = @player.choose_secret_code
		@guess1 = Code.new
		@guess2 = Code.new
		@guess3 = Code.new
		@guess4 = Code.new
		@guess5 = Code.new
		@guess6 = Code.new
		@guess7 = Code.new
		@guess8 = Code.new
		@guess9 = Code.new
		@guess10 = Code.new
		@guess11 = Code.new
		@guess12 = Code.new
		@computer_guesses = [@guess1, @guess2, @guess3, @guess4, @guess5, @guess6, @guess7, @guess8, @guess9, @guess10, @guess11, @guess12]
	end


	def gameplay
		won = false
		@computer_guesses.each do |guess_n|

			guess_n.random_code
			guess_n.check_guess(@solution_code)
			# for testing
			puts "The computer guessed: #{guess_n.code.inspect}"
			puts "Your code is: #{@solution_code.code.inspect}"
			if guess_n.code_broken?
				sleep 3
				puts "The computer broke your code!"
				won = true
				return true
			else
				sleep 3
				#guess_n.give_hint
			end
		end
		unless won
			puts "The computer ran out of guesses. You win!"
		end
	end

end