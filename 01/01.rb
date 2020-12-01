# loop through till right pointer reaches end
# 	return pair if sum is found
# increment left_pointer and right_pointer by 1
# 	loop through right pointer until it reaches the end

# stop if left pointer is at penultimate and right pointer is at the end, and the sum hasnt been found

def pair_adding_upto_2020(array)
	left_pointer = 0
	right_pointer = 1

	while (left_pointer != array.length - 1 &&  right_pointer != array.length) do

		(right_pointer...array.length).each do |right|
			sum = array[left_pointer] + array[right] 

			p "sum: #{sum}"
			p "left_pointer: #{left_pointer}"
			p "value at left_pointer: #{array[left_pointer]}"
			p "right_pointer: #{right}"
			p "value at right_pointer: #{array[right]}"
			p "-------"

			if sum == 2020
				return [array[left_pointer], array[right]]
			end
		end

		left_pointer += 1
		right_pointer += 1
	end

	return nil
end

input = File.read('input.txt', chomp: true).split("\n").map(&:to_i)

# first, second = pair_adding_upto_2020([1721, 979, 366, 299, 675, 1456])

first, second = pair_adding_upto_2020(input)
p [first, second]
p first + second
p first * second