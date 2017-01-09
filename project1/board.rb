class Board < Hash

	def initialize
		@board = {
			:h3 => "3", :a3 => "-", :b3 => "-", :c3 => "-",
			:h2 => "2", :a2 => "-", :b2 => "-", :c2 => "-",
			:h1 => "1", :a1 => "-", :b1 => "-", :c1 => "-",
			:h0 => " ", :ha => "a", :hb => "b", :hc => "c"
		}
	end

	def display_board
		puts "Current board:"
  		puts (@board[:h3] + "  " + @board[:a3] + "  " + @board[:b3] + "  " + @board[:c3])
  		puts (@board[:h2] + "  " + @board[:a2] + "  " + @board[:b2] + "  " + @board[:c2])
  		puts (@board[:h1] + "  " + @board[:a1] + "  " + @board[:b1] + "  " + @board[:c1])
  		puts (@board[:h0] + "  " + @board[:ha] + "  " + @board[:hb] + "  " + @board[:hc])
  	end

  	def update_board(position, value)
  		@board[position.to_sym] = value
  	end

  	def game_won?  		
  		if (@board[:a3] == @board[:b3] && @board[:b3] == @board[:c3] && @board[:c3] != "-") ||
  			(@board[:a2] == @board[:b2] && @board[:b2] == @board[:c2] && @board[:c2] != "-") ||
  			(@board[:a1] == @board[:b1] && @board[:b1] == @board[:c1] && @board[:c1] != "-") ||
  			(@board[:a3] == @board[:a2] && @board[:a2] == @board[:a1] && @board[:a1] != "-") ||
  			(@board[:b3] == @board[:b2] && @board[:b2] == @board[:b1] && @board[:b1] != "-") ||
  			(@board[:c3] == @board[:c2] && @board[:c2] == @board[:c1] && @board[:c1] != "-") ||
  			(@board[:a3] == @board[:b2] && @board[:b2] == @board[:c1] && @board[:c1] != "-") ||
  			(@board[:a1] == @board[:b2] && @board[:b2] == @board[:c3] && @board[:c3] != "-")
  			return true
  		else
  			return false
  		end
  	end

    def game_tied?
      @board.each do |key, value|
        if value == "-"
          return false
        end
      end
      return true unless game_won?
      false
    end

    def game_over?
      game_won? || game_tied?
    end

end




# Players need a way to enter actions: Position and x or 0
# Once I have their action, I modify the corresponding array and change the turn variable
# I check whether someone has won. If so I print it out. Else loop continues