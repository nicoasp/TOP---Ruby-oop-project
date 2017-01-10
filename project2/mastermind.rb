require './code.rb'
require './player.rb'


#introduction
puts "Welcome! What is your name?"
player_name = gets.chomp
player = Player.new(player_name)
puts "Welcome to Mastermind, #{player_name}."
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
sleep 3
puts "Good luck!"
sleep 3

#gameplay
solution_code = Code.new.random_code
puts "Ready for your first guess!"
sleep 3
guess = Code.new(player.guess_code)
guess.check_guess(solution_code)
tries = 1

until guess.code_broken? || tries == 12
	guess.give_hint
	sleep 3
	puts "You have #{12 - tries} tries remaining"
	sleep 5
	guess.set_code(player.guess_code)
	tries += 1
end

if guess.code_broken?
	puts "Congratulations! You broke the code in #{tries} tries!"
else
	puts "Your tries are over. You lose!"
end