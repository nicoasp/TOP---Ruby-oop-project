class Player
	attr_reader :symbol, :name
	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end

	def make_play
		puts "Your turn #{@name}! Choose a square! (a1 / a3 / c2...)"
		position = gets.chomp.downcase
		unless position.match /[abc][123]/
			puts "That's not a valid square! You lose your turn!"
			sleep 1
		end
		position
	end
end