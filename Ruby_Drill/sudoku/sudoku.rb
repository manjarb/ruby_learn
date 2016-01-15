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

  def convert_grid_into_row(grid_board)

    converted_grid_board = Array.new(grid_board.length){ Array.new(grid_board.length, 0) }

    out_row_counter = 0
    out_column_counter = 0

    temp_grid_scan = []
    temp_grid_scan_inside = []

    temp_grid_loop_count = grid_board.length - 1
    outer_grid_loop_start = 0
    outer_grid_loop_end = (grid_board.length / 3) - 1
    limit_counter = grid_board.length / 3

    second_position_counter = 0
    second_limit_counter = (grid_board.length / 3) - 1


        # puts ""
        # puts "grid_board"
        # print grid_board[1][0]
        # puts ""
        # puts ""

    for k in outer_grid_loop_start..outer_grid_loop_end
      for i in 0..temp_grid_loop_count

        inside_position = second_position_counter
        inside_limit = second_limit_counter

        for j in inside_position..inside_limit 
          
          converted_grid_board[i][j] = grid_board[out_row_counter][out_column_counter]

          # puts ""
          # print converted_grid_board
          # puts ""
          # print "#{out_row_counter} : #{out_column_counter}"
          # puts ""
          # print "#{grid_board[1][0]}"
          # puts ""

          out_column_counter += 1
          if out_column_counter >= grid_board.length
            out_column_counter = 0
            out_row_counter += 1
          end

          if out_row_counter >= grid_board.length
            out_row_counter = 0
          end

        end

        inside_position = i + 3
        inside_limit = (inside_limit) + 3 

      end
      second_position_counter += 3
      second_limit_counter += 3
    end


    return converted_grid_board

  end

  def grid_scan?(board_grid)

    temp_grid_scan = []
    temp_grid_scan_inside = []

    temp_grid_loop_count = board_grid.length - 1
    outer_grid_loop_start = 0
    outer_grid_loop_end = (board_grid.length / 3) - 1
    limit_counter = board_grid.length / 3

    second_position_counter = 0
    second_limit_counter = (board_grid.length / 3) - 1

    for k in outer_grid_loop_start..outer_grid_loop_end
      for i in 0..temp_grid_loop_count

        # puts ""
        # puts i
        # puts ""

        inside_position = second_position_counter
        inside_limit = second_limit_counter

        for j in inside_position..inside_limit 
          temp_grid_scan_int = board_grid[i]
          temp_grid_scan_inside << temp_grid_scan_int[j]

        end

        inside_position = i + 3
        inside_limit = (inside_limit) + 3 

        if temp_grid_scan_inside.length == 9
          temp_grid_scan << temp_grid_scan_inside
          temp_grid_scan_inside = []
        end

      end
      second_position_counter += 3
      second_limit_counter += 3
    end

    grid_intersection_scan = row_scan?(temp_grid_scan)
    grid_convert_scan = convert_grid_into_row(grid_intersection_scan)

    return grid_convert_scan
    #print temp_grid_scan
  end

  def compare_result_scan(row_scan,col_scan,grid_scan)
    compare_result = Array.new(row_scan.length){ Array.new(row_scan.length, 0) }
    first_compare_result = Array.new(row_scan.length){ Array.new(row_scan.length, 0) }
    compare_result = row_scan
    first_compare_result = row_scan

    for i in 0..row_scan.length - 1
      for j in 0..row_scan.length - 1

        if row_scan[i][j].kind_of?(Array)
          first_compare_result[i][j] = row_scan[i][j] & col_scan[i][j]
        end
        
      end
    end

    for i in 0..first_compare_result.length - 1
      for j in 0..first_compare_result.length - 1

        if first_compare_result[i][j].kind_of?(Array)
          compare_result[i][j] = first_compare_result[i][j] & grid_scan[i][j]
        end
        
      end
    end

    return compare_result
  end  

  def solve!
    original_board = create_board_array()
    row_board = create_board_array()
    column_board = create_board_array()
    grid_board = create_board_array()

    row_board = row_scan?(row_board)
    column_board = column_scan?(column_board)
    grid_board = grid_scan?(grid_board)

    compare_board = compare_result_scan(row_board,column_board,grid_board)

    row_board = row_scan?(row_board)
    column_board = column_scan?(column_board)
    grid_board = grid_scan?(grid_board)

    compare_board = compare_result_scan(row_board,column_board,grid_board)
         
    puts "solve!"
    # print original_board
    # puts ""
    # puts "row" 
    # print row_board
    # puts ""
    # puts "column" 
    # print column_board
    # puts ""
    # puts "grid" 
    # print grid_board
    # puts ""
    puts "compare" 
    print compare_board
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

puts ""

puts game.board

puts ""

# Remember: this will just fill out what it can and not "guess"
game.solve!