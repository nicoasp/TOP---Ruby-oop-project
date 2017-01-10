class Code < Array

	def initialize(code = [" ", " ", " ", " "])
		@code = code
	end

	def code
		@code
	end

	def set_code(code)
		@code = code
	end

	def random_code
		colors = ["red", "blue", "yellow", "green", "orange", "purple"]
		@code = [colors[rand(6)], colors[rand(6)], colors[rand(6)], colors[rand(6)]]
	end

	def check_guess(solution_code)
		@hint = []
		helper_code = @code
		@code.each_with_index do |guess_color, guess_index|
			if solution_code[guess_index] == guess_color
				@hint.push("*")
				helper_code.delete_at(guess_index)
			end
		end
		helper_code.each do |guess_color|
			if solution_code.include?(guess_color)
				@hint.push("o")
			end
		end
		@hint
	end

	def give_hint
		case @hint.length
		when 0
			puts "Uh, you didn't get a single color right! You suck!"
		when 1
			puts "Well, you COULD be worse... here's your hint:"
			@hint.each {|x| print x + " "}
		when 2
			puts "Not bad! Here's your hint:"
			@hint.each {|x| print x + " "}
		when 3
			puts "Getting close! Here's your hint:"
			@hint.each {|x| print x + " "}
		when 4
			puts "Getting close! Here's your hint:"
			@hint.each {|x| print x + " "}
		end
		puts
	end

	def code_broken?
		@hint == ["*", "*", "*", "*"]
	end

end



