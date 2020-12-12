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
		
		if !contains_two_sum(preamble, input[index])
			return input[index] 
		end

		preamble = input[index - 24..index]
		
		index += 1
		break if index >= input.length
	end
end

p run input




# start with 5 numbers as preamble
# find out if next number is sum of two numbers in array
# 	if it is, then move preamble forward by 1
# 		if it isnt report this as the weak number

=begin
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
In this example, after the 5-number preamble, almost every number is the sum of two of the previous 5 numbers; the only number that does not follow this rule is 127.

The first step of attacking the weakness in the XMAS data is to find the first number in the list (after the preamble) which is not the sum of two of the 25 numbers before it. What is the first number that does not have this property?

=end