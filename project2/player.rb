class Player

	def initialize(name)
		@name = name
	end

	def guess_code
		puts "Remember, valid colors are red, blue, yellow, green, orange and purple!"
		sleep 3
		puts "Enter your guess in this format: 'color1 color2 color3 color4'"
		guess = gets.chomp.split
	end

end
