# sample_input = File.read("sample_input.txt").split("\n")
# sample_input = File.read("fixed_sample.txt").split("\n")

input = File.read("input.txt").split("\n")

def transform_input(input)
	input.map do |el|
		{ command: el[0..2],
			value: el[4..-1].to_i
		}
	end
end

input = transform_input(input)

def deep_copy input
	new_input = []

	input.each do |instruction|
		new_input.push({
			command: instruction[:command],
			value: instruction[:value]
		})
	end

	return new_input
end


def run_unmodified input, index, visited_indices, accumulator
	instruction_length = input.length
	visited_indices = visited_indices.dup
	
	loop do
		if visited_indices.include?(index)
			return "LOOP!"
		end

		visited_indices.push(index)
		command = input[index][:command]
		value = input[index][:value]

		case command
		when "acc"
			accumulator += value
			index += 1
		when "jmp"
			index += value
		when "nop"
			index += 1
		end

		break if index >= instruction_length
	end

	return accumulator
end

def run input
	visited_indices = []
	index = 0
	accumulator = 0

	loop do
		visited_indices.push(index)
		command = input[index][:command]
		value = input[index][:value]

		case command
		when "acc"
			accumulator += value
			index += 1

		when "jmp"
			new_command_set = deep_copy(input)
			new_command_set[index][:command] = "nop"
			
			outcome = run_unmodified(new_command_set, index + 1,  visited_indices, accumulator)
			
			return outcome unless outcome == "LOOP!"
			index += value
		when "nop"
			new_command_set = deep_copy(input)
			new_command_set[index][:command] = "jmp"
			
			outcome = run_unmodified(new_command_set, index + value,  visited_indices, accumulator)
			
			return outcome unless outcome == "LOOP!"
			index += 1
		end
	end

end

p run(input)




# ---------------------
# After some careful analysis, you believe that exactly one instruction is corrupted.

# Somewhere in the program, either a jmp is supposed to be a nop, or a nop is supposed to be a jmp. (No acc instructions were harmed in the corruption of this boot code.)

# The program is supposed to terminate by attempting to execute an instruction immediately after the last instruction in the file. By changing exactly one jmp or nop, you can repair the boot code and make it terminate correctly.

# For example, consider the same program from above:

# 0 nop +0 | jmp +0 (infinite loop) strand 1, terminates
# 1 acc +1 | strand 2
# 2 jmp +4 | nop +4 strand 2, strand 2 (loop)
# 3 acc +3 
# 4 jmp -3 | strand 2 | nop -3 strand 3, strand 3 (loop)
# 5 acc -99
# 6 acc +1
# 7 jmp -4 | strand 3 | nop -4
# 8 acc +6

# start at strand 0 or main
# visited indices = [0]
# 	change nop to jump and start a strand (1)
# 		check against visited_indices
# 		end strand
# visited indices = [0,1]
# 	accumulator += 1
# visited_indices = [0, 1, 2]
# 	change jump to nop and start a strand (2)
# 		carry over visited indices and process program
# 	end if it is not working

# 	... so on till you find a strand that works.

# assumption - program loops and has a problem, and I can assume that I can only fix it by 

# iterate over given input
# track visited indices
# start with an accumulator value
# 	if command is nop or jmp, flip it
# 		navigate the command list with flipped command
# 		if the command encounters an index it has visited before, cancel that strand
# 		if command runs all the way through, and reaches index of length of commands, return to the main function and thats the command to change

# TARGET -- value of accumulator if command works
# function should return whether it works, as well as value of accumulator


# data structures
# -----

# visited_indices
# visited_indices_of_strand

# start with strand 0
# any new strand carries over visited indices to upto that point


# If you change the first instruction from nop +0 to jmp +0, it would create a single-instruction infinite loop, never leaving that instruction. If you change almost any of the jmp instructions, the program will still eventually find another jmp instruction and loop forever.

# However, if you change the second-to-last instruction (from jmp -4 to nop -4), the program terminates! The instructions are visited in this order:

# nop +0  | 1
# acc +1  | 2
# jmp +4  | 3
# acc +3  |
# jmp -3  |
# acc -99 |
# acc +1  | 4
# nop -4  | 5
# acc +6  | 6
# After the last instruction (acc +6), the program terminates by attempting to run the instruction below the last instruction in the file. With this change, after the program terminates, the accumulator contains the value 8 (acc +1, acc +1, acc +6).

# Fix the program so that it terminates normally by changing exactly one jmp (to nop) or nop (to jmp). What is the value of the accumulator after the program terminates?


