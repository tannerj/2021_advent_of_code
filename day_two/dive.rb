#! /usr/bin/env ruby

input_file = ARGV[0]
horizontal_position = 0
depth = 0

File.foreach(input_file) do |x|
  command = x.split(" ")
  horizontal_position += command[1].to_i if command[0] == "forward"
  depth += command[1].to_i if command[0] == "down"
  depth -= command[1].to_i if command[0] == "up"
end

puts "Horizontal Position x Depth: #{horizontal_position * depth}"
