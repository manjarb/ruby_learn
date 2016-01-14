def create_tic_tac_board
	tic_tac_array = ["O","X"]
	tic_tac_board = Array.new(3){ [tic_tac_array[rand(0..1)],tic_tac_array[rand(0..1)],tic_tac_array[rand(0..1)]] }

	print tic_tac_board
	puts ""
end

create_tic_tac_board()

############################
############################
############################

roster = [["Number", "Name", "Position", "Points per Game"],
         [12,"Joe Schmo","Center",[14, 32, 7, 0, 23] ],
         [9, "Ms. Buckets ", "Point Guard", [19, 0, 11, 22, 0] ],
         [31, "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ],
         [7, "Sally Talls", "Power Forward ", [18, 29, 26, 31, 19] ],
         [22, "MK DiBoux ", "Small Forward ", [11, 0, 23, 17, 0] ]]

def convert_roster_format(roster)
  # your code here
  # should return a new format of roster which is an array of hashes
  temp_array_to_hash = []
  temp_array_in_array_to_hash = []
  temp_array_in_array_in_array_to_hash = []
  player_hash= []

  for i in 1..roster.length - 1
  	for j in 0..roster[0].length - 1
  		
		temp_array_in_array_in_array_to_hash << roster[0][j]
		temp_array_in_array_in_array_to_hash << roster[i][j]
  		
  		temp_array_in_array_to_hash << temp_array_in_array_in_array_to_hash
  		temp_array_in_array_in_array_to_hash = []
  	end

  	temp_array_to_hash = Hash[ temp_array_in_array_to_hash ]
  	player_hash << temp_array_to_hash
  end
  
  #player_hash = roster[0]
  return player_hash
end

hashed_roster = convert_roster_format(roster)

print hashed_roster[2]
puts ""
# => { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] }

puts hashed_roster[0]["Name"] == "Joe Schmo" # outputs true