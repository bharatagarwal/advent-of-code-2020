require_relative 'processor'

sample_input = File.readlines("sample_input.txt", chomp: true)
input = File.readlines("input.txt", chomp: true)

sample_input = transform_input(sample_input)
input = transform_input(input)

puts sample_input
puts input

def switch_corrupted_instruction_for parsed_instructions

end

# visited_indices = []

# accumulator = 0

# index = 0

# while true
# 	command = input[index][:command]
# 	p "index: #{index}"
# 	p input[index]
# 	visited_indices.push(index)
	
# 	case command
# 	when "acc"
# 		accumulator += input[index][:value].to_i
# 		index += 1
# 	when "nop"
# 		visited_indices.push(index)
# 		index += 1
# 	when "jmp"
# 		visited_indices.push(index)
# 		index += input[index][:value].to_i
# 	end

# 	break if visited_indices.include?(index) || index >= input.length
# end

# puts accumulator