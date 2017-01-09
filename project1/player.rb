class Player
	attr_reader :symbol, :name
	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end

	def make_play
		puts "Your turn #{@name}! Choose a square! (a1 / a3 / c2...)"
		position = gets.chomp.downcase
		position
	end
end