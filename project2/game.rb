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

	def introduction
		puts "Welcome to Mastermind, #{@player.name}."
		sleep 3
		puts "You have 12 tries to break the secret code"
		sleep 3
		puts "Each try you can enter a possible code, which consists of 4 colors"
		sleep 5
		puts "You will get a hint after each guess..."
		sleep 5
		puts "giving you a '*' for each exact guess (both color and position)" 
		sleep 5
		puts "and an 'o' for each partial hit (correct color in the wrong position)"
		sleep 5
		puts "You won't know which of your colors was a hit!"
		sleep 5
		puts "For example, if the secret code is [red green green blue]..." 
		sleep 5
		puts "and you guess [red green blue yellow]..." 
		sleep 5
		puts "you get '* * o', meaning 2 exact hits and one partial!"
		sleep 5
		puts "Good luck!"
		sleep 3
	end

	def gameplay
		won = false
		@player_guesses.each_with_index do |guessn, index|
			puts "Your turn!"
			if index > 0
				puts "Here are your guesses so far:"
				(0..index - 1).each do |ind|
					print "Guess #{ind + 1}: #{@player_guesses[ind].code} - Hint: #{@player_guesses[ind].hint}"
					puts
				end
			end
			guessn.code = @player.guess_code
			guessn.check_guess(@solution_code.code)
			if guessn.code_broken?
				#Congratulate player and exit method
				puts "Congratulations! You have broken the code!"
				puts "#{@player.name} wins."
				won = true
				return true
			else
				#Give hint
				guessn.give_hint
				sleep 5
			end
		end
		unless won
			puts "Your guesses are over. You lose!"
		end
	end

end
