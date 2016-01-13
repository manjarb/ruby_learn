# Objective 2: Chessboard
$global_chessboard = []

def addvalue_chessboard(row,column,string)
	column_test = []
	old_array = []

	if $global_chessboard[row].nil?
		column_test.insert(column,string)
		$global_chessboard.insert(row,column_test)
	else
		old_array = $global_chessboard[row]

		if defined?(old_array[column])
			old_array[column] = string
		else
			old_array.insert(column,string)
		end

		$global_chessboard[row] = old_array
	end
	# column_test = column_test.insert(column,string)
	# $global_chessboard.insert(row,column_test)

	return $global_chessboard
end


print addvalue_chessboard(1,7,"testtt")
puts ""
print addvalue_chessboard(3,6,"testtt222")
puts ""
print addvalue_chessboard(2,2,"testtt33")
puts ""


# Objective 3: Data table