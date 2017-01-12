class Player
	attr_accessor :name

	def initialize
		puts "Welcome!. What is your name?"
		@name = gets.chomp
	end

	def guess_code
		puts "Enter your guess in this format: color1 color2 color3 color4"
		gets.chomp.split
	end

	def choose_secret_code
		puts "Enter your secret code in this format: color1 color2 color3 color4"
		gets.chomp.split
	end

end
