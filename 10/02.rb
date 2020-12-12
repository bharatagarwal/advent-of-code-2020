require 'pry'

# how many different ways they can be arranged

sample_input = File.readlines('sample_input.txt')
								 .map(&:to_i)

input = File.readlines('input.txt')
								 .map(&:to_i)

larger_sample = File.readlines('larger_sample.txt')
								 .map(&:to_i)

sample_input = sample_input.sort
sample_input.push(sample_input.last + 3)
sample_input.unshift(0)

larger_sample = larger_sample.sort
larger_sample.push(larger_sample.last + 3)
larger_sample.unshift(0)

input = input.sort
input.push(input.last + 3)
input.unshift(0)

p sample_input

[22, 19, 16, 15, 12, 11, 10, 7, 6, 5, 4, 1, 0]

22 --> 19 --> 16 --> 15 --> 12 --> 10 --> 7 --> 4 --> 1 --> 0
														|							|
														|							|----> 6 --> 4 --> 1 --> 0
														|							|			 |
														|							|			 |---> 5 --> 4 --> 1 --> 0
														|							|
														|							|---> 5 --> 4 --> 1 --> 0			 
														|
														|
														|----> 11 --> 10 --> 7 --> 4 --> 1 --> 0
																								|							
																								|----> 6 --> 4 --> 1 --> 0
																								|			 |						 
																								|			 |---> 5 --> 4 --> 1 --> 0
																								|
																								|---> 5 --> 4 --> 1 --> 0

there is some self similarity here



