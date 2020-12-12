def contains_two_sum array, number
	array = array.sort

	left = 0
	right = 4

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

p contains_two_sum([1, 2, 3, 4, 5], 6)
p contains_two_sum([1, 2, 3, 4, 5], 11)