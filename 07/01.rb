require_relative "processor"

sample_input = '''light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.'''

input = File.readlines('input.txt', chomp: true)
sample_input = sample_input.split("\n")

colour_capacities = {}

input.each do |line|
	process_details(line, colour_capacities)
end

p colour_capacities

target_colour = "shiny gold"
count = 0

def can_contain(target_colour, colour_key, colour_capacities)
	return false if colour_capacities[colour_key].nil?
	
	colour_capacities[colour_key].any? do |info_store|
		if info_store.values.include?(target_colour)
			return true
		elsif info_store.values.include?("none")
			return false
		end
	end

	colours_inside = colour_capacities[colour_key].map do |obj|
		obj[:colour]
	end

	colours_inside.any? do |colour|
		can_contain(target_colour, colour, colour_capacities)
	end
end

colour_capacities.keys.each do |colour|
	count += 1 if can_contain(target_colour, colour, colour_capacities)
end

p count

# iterate over each colour ie key from the colour_capacities object
# 	check its value ie an array if any object inside has a key with value as target_colour
