#! /usr/bin/env ruby

#
# 2021 Advent of Code Day One: Sonar Sweep
# https://adventofcode.com/2021/day/1
#
# Ex: ./depth_measurement_increase.rb path/to/input_data.txt

# Data file
input_file = ARGV[0]

# Iterate over the data and combine each consecutive set
# of 3 data points into a data window (Array) and store
# it in this array.
depth_windows = []

# Once we have our windows store the last iterated window's
# total to compare the current window total
previous_window_total = nil

# Keeps track of number of depth increases between windows
depth_increase = 0


# Takes a value from the data set and adds it to correct
# depth_windows
def populate_depth_windows(value, depth_windows)
  # 3 + nth time through the loop
  if depth_windows.length > 2
    previous_window = depth_windows.pop
    second_window = depth_windows.pop
    second_window << value
    previous_window << value
    depth_windows << second_window
    depth_windows << previous_window
    depth_windows << [value]
  end
  # Third time through the loop
  if depth_windows.length == 2
    previous_window = depth_windows.pop
    first_window = depth_windows.pop
    first_window << value
    previous_window << value
    depth_windows << first_window
    depth_windows << previous_window
    depth_windows << [value]
  end
  # Second time through the loop
  if depth_windows.length == 1
    previous_window = depth_windows.pop
    previous_window << value
    depth_windows << previous_window
    depth_windows << [value]
  end
  # First time through the loop
  if depth_windows.length == 0
    depth_windows << [value]
  end

  return depth_windows
end

# Iterate over input data and pass each value off
# to populate the depth_windows
File.foreach(input_file) do |x|  
  depth_windows = populate_depth_windows(x, depth_windows)   
end

# The instructions state that we should only use complete
# windows (Windows with 3 values in them). Therefore, we
# pop the last window off until the last window is a full
# window (length of 3 data points)
depth_windows.pop until depth_windows.last.length == 3

# Compare each depth_window with it's previous window
# if it is greater in value, increase depth_increase
# by 1.
depth_windows.each do |x|
  window_total = 0
  x.each { |v| window_total += v.to_i }
  if previous_window_total
    depth_increase += 1 if window_total > previous_window_total  
  end

  previous_window_total = window_total
end

puts "Depth Increase Total: #{depth_increase}"
