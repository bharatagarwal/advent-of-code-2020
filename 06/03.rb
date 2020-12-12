def process_info(string, voters)
	return string.length if voters == 1

	dict = {}

	string.chars.each do |char|
		if dict[char].nil?
			dict[char] = 1
		else
			dict[char] += 1
		end
	end

	dict.values.count(voters)
end

p process_info("abc", 1) == 3
p process_info("abc", 3) == 0
p process_info("aabc", 2) == 1
p process_info("aaaa", 4) == 1
p process_info("b", 1) == 1