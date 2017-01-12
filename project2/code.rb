class Code
	attr_accessor :code
	attr_reader :hint

	def initialize
		@code = []
		@hint = []
	end

	def random_code
		colors = ["red", "blue", "yellow", "green", "orange", "purple"]
		@code = [colors[rand(6)], colors[rand(6)], colors[rand(6)], colors[rand(6)]]
	end

	def check_guess(solution_code)
		helper_code = []
		helper_solution = []
		@code.each_with_index do |guess, index|
			if solution_code.code[index] == guess
				@hint.push("*")
			else
				helper_code.push(guess)
				helper_solution.push(solution_code.code[index])
			end
		end
		helper_code.each do |color|
			if helper_solution.include?(color)
				@hint.push("o")
				helper_solution.delete(color)
			end
		end
		@hint
	end

	def give_hint
		@hint.each {|x| print x + " "}
		puts
	end

	def code_broken?
		@hint == ["*", "*", "*", "*"]
	end

end



