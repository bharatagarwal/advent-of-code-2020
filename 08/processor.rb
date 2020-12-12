def transform_input(input)
	input.map do |el|
		{ command: el[0..2],
			value: el[4..-1].to_i
		}
	end
end