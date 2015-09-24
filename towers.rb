def towers(disk_num)
	puts ("im working")
	towers = [Array(1..disk_num),[],[]]
	towers[0].sort! do |n, m|
		m <=> n
	end
	has_won = false
	while has_won != true
		puts (towers).to_s
		user_move = handle_input(towers)		
		has_won = true if game_won?(towers, disk_num)
	end
	puts ("game won!!")
end

def handle_input(towers)
	gets_disk_selection = get_input()
	input_valid = validate_input(gets_disk_selection)
	while input_valid == false
		puts ("Please enter a number from 0 - 2")
		gets_disk_selection = get_input
		input_valid = validate_input(gets_disk_selection)
	end
	gets_disk_selection = gets_disk_selection.to_i
	puts ("Now where do you want to place it")
	gets_destination = gets.chomp.to_i
	if move_legal?(towers, gets_disk_selection, gets_destination)
		move_disk(towers, gets_disk_selection, gets_destination)
	else puts ("Move is illegal, try again")
	end
	
end

def get_input()
	puts ("which tower do you want to move from?(0 - 2)")
	gets_disk_selection = gets.chomp
	return gets_disk_selection
end

def validate_input(input)
	if (input == "0") || (input == "1") || (input == "2")
		return true
	else
		return false
	end
end

def move_legal?(towers, tower_picked, tower_destination)
	return false unless (tower_picked == 0) || (tower_picked == 1) || (tower_picked == 2)  
	if (towers[tower_picked].empty? != true) && ((towers[tower_destination].empty?) || (towers[tower_picked].last < towers[tower_destination].last))
		return true
	else return false
	end
end

def move_disk(towers ,tower_picked, tower_destination)	
	disk = towers[tower_picked].pop
	towers[tower_destination].push(disk)
end

def game_won?(towers, disk_num)
	(1..disk_num).all? do |disk|
		towers[2].include?(disk)
	end
end
puts (towers(4))