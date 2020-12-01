# --- Day 1: Report Repair ---

# After saving Christmas five years in a row, youve decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

# The tropical island has its own currency and is entirely cash-only. 

# The gold coins used there have a little picture of a starfish; the locals just call them stars. 

# None of the currency exchanges seem to have heard of them, but somehow, youll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

# To save your vacation, you need to get all fifty stars by December 25th.

# Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

# Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isnt quite adding up.

# Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

# For example, suppose your expense report contained the following:

# 1721
# 979
# 366
# 299
# 675
# 1456
# In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

# Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

# find entries that add up to 2020; and multiply them together

# 1721, 979, 366, 299, 675, 1456
# ^
#        ^


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
# sort the solution, then i can have two pointers from the start and the end

# [299, 366, 675, 979, 1456, 1721]
#    ^												^					
# if sum is greater than 2020, move right pointer to the left
# 	if the sum us less than 2020, move left pointer to the right
# 		stop when the sum is 2020, and if the pointers meet without sum being achieved, we know that its not there.

# def pair_adding_upto_2020(array)
# 	sum = 0
# 	left_pointer = 0
# 	right_pointer = array.length - 1

# 	sorted_array = array.sort
# 	p sorted_array

# 	while (left_pointer <= right_pointer) do
# 		sum = array[left_pointer] + array[right_pointer]
# 		p "sum: #{sum}"
# 		p "left_pointer: #{left_pointer}"
# 		p "right_pointer: #{right_pointer}"
		
# 		if sum == 2020
# 			p array[left_pointer], array[right_pointer]
# 			return [array[left_pointer], array[right_pointer]]
# 		elsif sum > 2020
# 			right_pointer -= 1
# 		else
# 			left_pointer += 1
# 		end
# 	end

# 	return nil
# end

input = File.read('input.txt', chomp: true).split("\n").map(&:to_i)

# first, second = pair_adding_upto_2020([1721, 979, 366, 299, 675, 1456])

first, second = pair_adding_upto_2020(input)
p [first, second]
p first + second
p first * second