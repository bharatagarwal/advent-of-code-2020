def trio_adding_upto_2020(array)
	left_pointer = 0
	middle_pointer = 1
	right_pointer = 2

	while (left_pointer != array.length - 2 &&  middle_pointer != array.length - 1 && right_pointer != array.length) do

		(middle_pointer...array.length).each do |middle|
			(right_pointer...array.length).each do |right|

				sum = array[left_pointer] + array[middle] + array[right]
				
				if sum == 2020
					return [array[left_pointer], array[middle], array[right]]

				end
			end
		end

		left_pointer += 1
		middle_pointer += 1
		right_pointer += 1
	end

	return nil
end

input = File.read('input.txt', chomp: true).split("\n").map(&:to_i)

first, second, third = trio_adding_upto_2020(input)

p [first, second, third]
p first + second + third
p first * second * third