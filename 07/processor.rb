def process_details(string, deets)
	split_deets = string.split(/(bag|bags)/) - ["bags"] - ["bag"] - ["s."] - ["."]

	original_colour = split_deets[0][0..-2]

	if split_deets[1].include?("other") 
		deets[original_colour] = [{
			colour: nil,
			count: 0
		}]
	else 
		first_count, first_colour = split_deets[1].scan(/contain (\d+) (\w+ \w+)/)[0]
		deets[original_colour] = [{
		colour: first_colour,
		count: first_count 
		}]
	end

	index = 2
	
	loop do
		break if index >= split_deets.size

		next_count, next_colour = split_deets[index].scan(/(\d+) (\w+ \w+)/)[0]

		deets[original_colour].push({
			colour: next_colour,
			count: next_count
		})

		index += 1
	end
end