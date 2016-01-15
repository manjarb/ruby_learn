class Sudoku
  def initialize(board_string)
  	@board_string = board_string
    @board = []
    @board_size = board_string.length
    @row_size = Math.sqrt(@board_size).to_i
    @column_size = @row_size

    # define 2 dimensional array 
    @array_of_numbers = []
    k = 0

    for i in 0..@row_size - 1
      @array_of_numbers = []
      for j in 0..@column_size - 1 
        @array_of_numbers << @board_string[k]
        k += 1
      end
      @board << @array_of_numbers

    end

  end

  def row_scan
    @board.each

  end

  def col_scan

  end

  def grid_scan

  end

  def solve!

  end

  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.

  # Loads the @board array from a string matching the example above.

  def board
  	#@board_string
  	
  	# @board_string.each_line { |line|

  	# }
    print @board
    puts ""
    @board_display = []

    @board.each { |x|
      @board_display << x.join(" ") 
    }
    puts ""
    puts @board_display
    puts ""

  end
end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
#game.solve!

#puts game.board
game.board