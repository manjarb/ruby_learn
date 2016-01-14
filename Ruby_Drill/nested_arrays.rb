# Objective 2: Chessboard
$global_chessboard = []

def addvalue_chessboard(row,column,string)
	column_test = []
	old_array = []

	if $global_chessboard[row].nil?
		column_test[column] = string
		$global_chessboard[row] = column_test
		#puts "loop2"
	else
		old_array = $global_chessboard[row]

		old_array[column] = string

		$global_chessboard[row] = old_array
		#puts "loop3"
	end

	return $global_chessboard
end


addvalue_chessboard(0,0,"B Rook")

addvalue_chessboard(0,1,"B Knight")

addvalue_chessboard(0,2,"B Bishop")

addvalue_chessboard(0,3,"B Queen")

addvalue_chessboard(0,4,"B King")

addvalue_chessboard(0,5,"B Bishop")

addvalue_chessboard(0,6,"B Knight")

addvalue_chessboard(0,7,"B Rook")


addvalue_chessboard(1,0,"B Pawn")

addvalue_chessboard(1,1,"B Pawn")

addvalue_chessboard(1,2,"B Pawn")

addvalue_chessboard(1,3,"B Pawn")

addvalue_chessboard(1,4,"B Pawn")

addvalue_chessboard(1,5,"B Pawn")

addvalue_chessboard(1,6,"B Pawn")

addvalue_chessboard(1,7,"B Pawn")


#########
#####################################
#####################################
#####################################

addvalue_chessboard(7,0,"W Rook")

addvalue_chessboard(7,1,"W Knight")

addvalue_chessboard(7,2,"W Bishop")

addvalue_chessboard(7,3,"W Queen")

addvalue_chessboard(7,4,"W King")

addvalue_chessboard(7,5,"W Bishop")

addvalue_chessboard(7,6,"W Knight")

addvalue_chessboard(7,7,"W Rook")


addvalue_chessboard(6,0,"W Pawn")

addvalue_chessboard(6,1,"W Pawn")

addvalue_chessboard(6,2,"W Pawn")

addvalue_chessboard(6,3,"W Pawn")

addvalue_chessboard(6,4,"W Pawn")

addvalue_chessboard(6,5,"W Pawn")

addvalue_chessboard(6,6,"W Pawn")

addvalue_chessboard(6,7,"W Pawn")

####################################
####################################
####################################

# Objective 3: Data table
data_table = [
				['Number','Name','Position','Points per Game'],
				['12','Joe Schmo','Center',[14, 32, 7, 0, 23]],
				['9','Ms. Buckets','Point Guard',[19, 0, 11, 22, 0]],
				['31','Harvey Kay','Shooting Guard',[0, 30, 16, 0, 25]],
				['18','Sally Talls','Power Forward',[18, 29, 26, 31, 19]],
				['22','MK DiBoux','Small Forward',[11, 0, 23, 17, 0]]
			  ]

puts data_table[3][2] == "Shooting Guard" # outputs true
puts data_table[1][3] == [14, 32, 7, 0, 23] # outputs true






















