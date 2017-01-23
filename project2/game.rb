require './code.rb'
require './player.rb'

class Game


	def initialize
		@solution_code = Code.new
		@solution_code.random_code
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
		@player_guesses = [@guess1, @guess2, @guess3, @guess4, @guess5, @guess6, @guess7, @guess8, @guess9, @guess10, @guess11, @guess12]
		@player = Player.new
	end


	def gameplay
		won = false
		@player_guesses.each do |guess_n|

			guess_n.code = @player.guess_code
			guess_n.check_guess(@solution_code)

			if guess_n.code_broken?
				puts "Congratulations! You have broken the code!"
				won = true
				return true
			else
				guess_n.give_hint
				sleep 3
			end
		end
		unless won
			puts "Your guesses are over. You lose!"
			puts "The secret code was #{@solution_code.code}"
		end
	end

end
