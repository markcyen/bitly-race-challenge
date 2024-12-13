require_relative 'start'
require './spec/spec_helper'


puts ""
puts ""
puts "Welcome to the Sail Race App where you can average the race times."
puts ""
puts "The race started at 08:00 AM, DAY 1 from the docks of Rhode Island."
puts ""
puts "The final destination was the docks of Bermuda."
puts ""
puts "This app will calculate the average time (in minutes)."
puts "------------------------------------------------------"
puts ""

setup_times_array = Setup.new
race_times = AverageRaceTimes.new
Start.program(setup_times_array)

array_of_race_times = setup_times_array.times
final_times = race_times.array_of_final_times(array_of_race_times)
average_times = race_times.average_time

count = 0
new_array = array_of_race_times.map do |time|
  "#{count += 1}" + " " + time
end

times_hash = Hash[new_array.zip(race_times.minutes_array)]

# top_three = []
# binding.pry
sort_times_hash = times_hash.sort_by { |time, minutes| minutes }
top_three = sort_times_hash[0..2]

new_array_of_times = ["12:00 AM, DAY 4", "09:00 PM, DAY 3", "11:39 AM, DAY 5", "08:37 PM, DAY 4"]
new_times = setup_times_array.bulk_times(new_array_of_times)
new_race_times = AverageRaceTimes.new
new_race_times.array_of_final_times(new_times)
avg_new_times = new_race_times.average_time

puts "Here is bulk times average: #{avg_new_times}"

puts "------------------------------------------------------------------"
puts "The final finish times and race times in minutes are: "
puts ""

times_hash.each do |boat, minutes|
  print "Boat ##{boat.split.first}. Finished at: "
  print boat.split.drop(1).join(" ")
  print "; Finished in: "
  print minutes
  print " minutes"
  puts ""
end

puts "------------------------------------------------------------------"
puts "Top Three Boats"
top_three.each do |boat|
  puts "Boat ##{boat.first}"
end

puts "------------------------------------------------------------------"
puts ""
puts "******************************************************************"
puts "The average of the race times is: #{average_times} minutes."
puts "******************************************************************"
