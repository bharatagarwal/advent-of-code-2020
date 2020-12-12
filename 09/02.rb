input = File
								.read('input.txt')
								.split("\n")
								.map(&:to_i)

def contains_two_sum array, number
	array = array.sort

	left = 0
	right = 24

	loop do
		if array[left] + array[right] > number
			right -= 1
		elsif array[left] + array[right] < number
			left += 1
		else
			return true
		end
				
		break if left >= right
	end

	false
end


def run input # returns first number to not follow rule
	preamble = input[0..24]
	index = 25

	loop do
		
		return index  unless contains_two_sum(preamble, input[index])

		preamble = input[index - 24..index]
		
		index += 1
		break if index >= input.length
	end
end

index_of_outlier = run(input) # 14, ie 15th number
p input[index_of_outlier]

minimum_window_size = 2
maximum_windows_size = index_of_outlier # 15 - 1 = 14

(minimum_window_size..maximum_windows_size).each do |window_size|
	start_index = 0
	end_index = window_size - 1

	while end_index < index_of_outlier do
		if input[start_index..end_index].sum == input[index_of_outlier]
			p input[start_index..end_index].sum
			p input[start_index..end_index]
			p input[start_index..end_index].min
			p input[start_index..end_index].max
			p input[start_index..end_index].max + input[start_index..end_index].min
		end
		start_index += 1
		end_index += 1
	end
end

=begin
	
--- Part Two ---
The final step in breaking the XMAS encryption relies on the invalid number you just found: you must find a contiguous set of at least two numbers in your list which sum to the invalid number from step 1.

Again consider the above example:

35
20
15 +
25
47
40 +
62
55
65
95  -
102
117
150
182 -
127 *
219
299
277
309
576

In this list, adding up all of the numbers from 15 through 40 produces the invalid number from step 1, 127. (Of course, the contiguous set of numbers in your actual list might be much longer.)

To find the encryption weakness, add together the smallest and largest number in this contiguous range; in this example, these are 15 and 47, producing 62.

What is the encryption weakness in your XMAS-encrypted list of numbers?
=end