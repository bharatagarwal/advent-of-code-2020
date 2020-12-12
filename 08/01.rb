require_relative 'processor'

sample_input = File.readlines("sample_input.txt", chomp: true)
input = File.readlines("input.txt", chomp: true)

sample_input = transform_input(sample_input)
input = transform_input(input)

puts sample_input
puts input

# point at which you reach visit the same index again, i'd like to change the path of this program

# jumps don't wrap around
# start stepping back, and keep changing jump to no operation until there's a way for the program to terminate.

# every time you encounter a negative step or no operation
# 	follow the path through
# 		if you reach a repeated index, change it the other one
# 			verify the other path
# 		if you don't reach the end of the path, then you're good.

def check_if_command_will_go_through parsed_instructions, visited_indices, index
	loop do
		
	end

end

def switch_corrupted_instruction_for parsed_instructions
	visited_indices = []

	parsed_instructions.each_with_index do |instruction, index|
		visited_indices.push(index)

		if instruction[:command] == "nop" || (instruction[:command] == "tmp" && instruction[:value] < 0)
			check_if_command_will_go_through(parsed_instructions, visited_indices, index)
		end
	end
end

def calculate_accumulator_before_looping parsed_instructions
	accumulator = 0
	visited_indices = []
	index = 0

	loop do 
		visited_indices.push(index)

		command = parsed_instructions[index][:command]
		value = parsed_instructions[index][:value].to_i

		case command
		when "acc"
			accumulator += value
			index += 1
		when "nop"
			index += 1
		when "jmp"
			index += value
		end

		break if visited_indices.include?(index) || index >= parsed_instructions.length
	end

	return accumulator
end

puts input
puts calculate_accumulator_before_looping(input)

