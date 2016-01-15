class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board_origin = []
    @all_posible_value = ["1","2","3","4","5","6","7","8","9"]
  end

  def create_board_array
    board_array = []
    board_size = @board_string.length
    row_size = Math.sqrt(board_size).to_i
    column_size = row_size

    k = 0
    for i in 0..row_size - 1
      array_of_numbers = []
      for j in 0..column_size - 1 
        array_of_numbers << @board_string[k]
        k += 1
      end
      board_array << array_of_numbers

    end

    return board_array
  end

  def row_scan?(board_row)

    for i in 0..board_row.length - 1
      intersection = board_row[i] & @all_posible_value
      difference = @all_posible_value - intersection

      if difference.length <= 1
        difference = difference[0]
      end

      temp_row_scan = board_row[i]

      for j in 0..temp_row_scan.length - 1
        if temp_row_scan[j] == "0"
           temp_row_scan[j] = difference
        end
      end
      board_row[i] = temp_row_scan
    end

    return board_row

  end

  def convert_array_row?(array)

    temp_column_tranfrom = []
    temp_search_intersection = []

    for i in 0..array.length - 1
      temp_column_tranfrom = []
      for j in 0..array.length - 1 
        temp_column_scan = array[j]
        temp_column_tranfrom << temp_column_scan[i]
      end

      temp_search_intersection << temp_column_tranfrom

    end

    return temp_search_intersection

  end

  def column_scan?(board_column)

    temp_column_tranfrom = []
    temp_search_intersection = []

    for i in 0..board_column.length - 1
      temp_column_tranfrom = []
      for j in 0..board_column.length - 1 
        temp_column_scan = board_column[j]
        temp_column_tranfrom << temp_column_scan[i]
      end

      temp_search_intersection << temp_column_tranfrom

    end

    column_intersection_scan = row_scan?(temp_search_intersection)
    column_converted_scan = convert_array_row?(column_intersection_scan)

    return column_converted_scan
  end

  def grid_scan?(board_grid)

    return board_grid
  end

  def solve!
    original_board = create_board_array()
    row_board = create_board_array()
    column_board = create_board_array()
    grid_board = create_board_array()

    row_board = row_scan?(row_board)
    column_board = column_scan?(column_board)
    grid_board = grid_scan?(grid_board)
         
    puts "solve!"
    print original_board
    puts ""
    puts "row" 
    print row_board
    puts ""
    puts "column" 
    print column_board
    puts ""
    puts "grid" 
    print grid_board
    puts ""


  end

  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board
    board = create_board_array()
    board_display = []

    board.each { |x|
      board_display << x.join(" ") 
    }
    # puts ""
    # puts board_display
    return board_display
  end
end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
game.solve!

puts ""

puts game.board