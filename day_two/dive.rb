#! /usr/bin/env ruby

# 2021 Advent of Code Day Two: Dive!
# https://adventofcode.com/2021/day/2
#
# Ex: ./dive.rb path/to/input_data.txt

# Input Data
input_file = ARGV[0]

horizontal_position = 0
aim = 0
depth = 0

# Input lines given as:
# forward 5
# up 2
# down 1
# Iterate over each line and separate the 
# direction and unit and apply them to the
# correct variables.
File.foreach(input_file) do |x|
  command = x.split(" ")
  if command[0] == "forward"
    horizontal_position += command[1].to_i
    # Depth is calculated by multipling the current aim by the unit
    # in the move and adding that to the existing depth.
    depth += (aim * command[1].to_i)
  end
  aim += command[1].to_i if command[0] == "down"
  aim -= command[1].to_i if command[0] == "up"
end

puts "Horizontal Position x Depth: #{horizontal_position * depth}"
