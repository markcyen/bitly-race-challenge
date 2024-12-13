require './spec/spec_helper'

class Start
  def self.program(setup)
    # array_of_final_times = []
    count = 0

    print "How many boats were in the race (1-50)? "
    number_of_boats_in_race = gets.chomp
    puts ""

    while (
      !(number_of_boats_in_race !~ /\D/) ||
      (number_of_boats_in_race.to_i < 1 || number_of_boats_in_race.to_i > 50)
    ) do
      print "Invalid Entry! Please re-enter the number of boats in the race: "
      number_of_boats_in_race = gets.chomp
      puts ""
    end

    puts "Instructions are the following: "
    puts "Please enter the final times (in the format HH:MM xM, DAY n)."
    puts "HH (1-12), MM (0-59), xM (AM or PM), DAY n (1-99)."
    puts "For example, 02:24 PM, DAY 24 is a valid entry."
    puts ""

    for i in 1..number_of_boats_in_race.to_i do
      print "Input the final time here for boat #{count += 1}: "
      input = gets.chomp
      puts "---------------------------------------------------------------"
      puts ""

      # while input.split.size != 4 || !Validate.final_check?(input)
      while !setup.legit_input?(input)
        puts "You have entered incorrectly. Please re-enter again."
        print "Input the final time here for boat #{count}: "
        input = gets.chomp
        puts "---------------------------------------------------------------"
        puts ""
      end

      setup.shovel_times(input)
    end
  end
end
