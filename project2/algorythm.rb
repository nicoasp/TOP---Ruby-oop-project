=begin
 Create a set S of the 1296 possible codes (1111, 1112... 6665, 6666)
 Use check_guess method on code [1, 1, 2, 2] and obtain hint

Process 1
 Run check_guess method with [1, 1, 2, 2] using every other possible code as solution.
 Each code that doesn't produce the same hint for [1, 1, 2, 2] as the solution code,
 take out of the possible solutions set S.

Minimax process:
 For each of 1295 remaining unused codes, 
 for each possible color/white peg score (15 possibilities including * * * *)
 calculate how many possibilities in S would be eliminated (that means running Process 1)
 Save as the "score" of that unused code the minimum number of possibilities it might eliminate
 Choose as next guess one of the highest scoring, if possible belonging to S
=end


class CodeBreaker

	attr_accessor :solutions_set, :total_set, :next_guess, :last_hint, :guesses_made
	attr_reader :solution_code, :possible_hints

	def initialize
		@total_set = []
		(1..6).each do |n1|
			(1..6).each do |n2|
				(1..6).each do |n3|
					(1..6).each do |n4|
						@total_set.push([n1, n2, n3, n4])
					end
				end
			end
		end
		@solutions_set = []
		(1..6).each do |n1|
			(1..6).each do |n2|
				(1..6).each do |n3|
					(1..6).each do |n4|
						@solutions_set.push([n1, n2, n3, n4])
					end
				end
			end
		end
		@solution_code = [rand(6)+1, rand(6)+1, rand(6)+1, rand(6)+1]
		@possible_hints = [["*", "*", "*", "*"], ["*", "*", "*", "o"], ["*", "*", "*"], ["*", "*", "o", "o"], ["*", "*", "o"], ["*", "*"], ["*", "o", "o", "o"], ["*", "o", "o"], ["*", "o"], ["*"], ["o", "o", "o", "o"], ["o", "o", "o"], ["o", "o"], ["o"], []]
		@next_guess = [1, 1, 2, 2]
		@total_set.delete(@next_guess)
		@guesses_made = 1
		@last_hint = []
		@array_of_scores = []
	end


	def check_guess(code, other_code)
		hint = []
		helper_code = []
		helper_solution = []

		code.each_with_index do |guess, index|
			if other_code[index] == guess
				hint.push("*")
			else
				helper_code.push(guess)
				helper_solution.push(other_code[index])
			end
		end
		helper_code.each do |color|
			if helper_solution.include?(color)
				hint.push("o")
				helper_solution.delete(color)
			end
		end
		hint
	end

	def check_guess_with_solution
		@last_hint = check_guess(@next_guess, @solution_code)
	end

	def choose_guess
		max_indexes = []
		max_score = @array_of_scores.max
		if max_score == 0
			return false
		end

		@array_of_scores.each_with_index do |score, index|
			if score == max_score
				max_indexes.push(index)
			end
		end

		max_in_solutions = false
		max_indexes.each do |index|
			if @solutions_set.include?(@total_set[index])
				@next_guess = @total_set[index]
				@guesses_made += 1
				@total_set.delete(@next_guess)
				max_in_solutions = true
				return true
			end
		end
		unless max_in_solutions
			@next_guess = @total_set[max_indexes[0]]
			@guesses_made += 1
			@total_set.delete(@next_guess)
		end
	end

	def delete_impossible_codes
		unless @last_hint == ["*", "*", "*", "*"]
			@solutions_set.delete(@next_guess)
		end
		@total_set.each do |possible_code|
			helper_hint = check_guess(@next_guess, possible_code)
			unless helper_hint == @last_hint
				@solutions_set.delete(possible_code)
			end
		end
	end

	def count_potential_deletes
		@total_set.each do |unused_code|
			deletes_by_solution = []
			@possible_hints.each do |possible_hint|
				deletes = 0
				@solutions_set.each do |possible_code|
					helper_hint = check_guess(unused_code, possible_code)
					unless helper_hint == possible_hint
						deletes += 1
					end
				end
				deletes_by_solution.push(deletes)
			end
			@array_of_scores.push(deletes_by_solution.min)
		end
		@array_of_scores
	end


end

a = CodeBreaker.new
# Use check_guess method on code [1, 1, 2, 2] and obtain hint
a.check_guess_with_solution

until a.last_hint == ["*", "*", "*", "*"] || a.solutions_set.length == 1
	a.delete_impossible_codes
	a.count_potential_deletes
	a.choose_guess
	a.check_guess_with_solution

end

puts "Finished!"
puts "Guesses made: #{a.guesses_made}"
puts a.solutions_set.inspect
puts a.solution_code.inspect

	










