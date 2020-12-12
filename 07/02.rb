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


def count_individual_bags_inside_colour(bag_colour, colour_capacities)
	return 0 if bag_colour.nil?
	
	count = 0
	colour_capacities[bag_colour].each do |object|
		count += object[:count].to_i + object[:count].to_i * count_individual_bags_inside_colour(object[:colour], colour_capacities)
	end

	count
end

p count_individual_bags_inside_colour("shiny gold", colour_capacities)