#! /usr/bin/env ruby

input_file = ARGV[0]
horizontal_position = 0
aim = 0
depth = 0

File.foreach(input_file) do |x|
  command = x.split(" ")
  if command[0] == "forward"
    horizontal_position += command[1].to_i
    depth += (aim * command[1].to_i)
  end
  aim += command[1].to_i if command[0] == "down"
  aim -= command[1].to_i if command[0] == "up"
end

puts "Horizontal Position x Depth: #{horizontal_position * depth}"
