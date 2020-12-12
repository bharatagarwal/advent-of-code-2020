sample_input = File.readlines('sample_input.txt')
								 .map(&:to_i)

larger_sample = File.readlines('larger_sample.txt')
								 .map(&:to_i)

input = File.readlines('input.txt')
								 .map(&:to_i)


def run input
	input = input.dup.sort
	input.unshift(0)

	adapter_differences = {
		one: 0,
		two: 0,
		three: 0
	}

	input.each_with_index do |value, index|
		break if index == input.length - 1

		difference = input[index + 1] - value

		case difference
		when 1
			adapter_differences[:one] += 1
		when 2
			adapter_differences[:two] += 1
		when 3
			adapter_differences[:three] += 1
		else
			break
		end
	end

	adapter_differences[:three] += 1 # because built-in is higher by 3 than highest

	p adapter_differences
end

run sample_input
run larger_sample
run input


# sort the input
# iterate and check whether next item is within difference of 3
# if within difference, keep track of use
# break if difference greater than 3