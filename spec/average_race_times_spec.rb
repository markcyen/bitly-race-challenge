require 'spec_helper'

RSpec.describe "Calculate Average Race Times" do
  context "Two race times" do
    race_times = ["12:00 PM, DAY 1", "12:01 PM, DAY 1"]
    calculate_race = AverageRaceTimes.new
    converted_times = calculate_race.array_of_final_times(race_times)
    collected_minutes_in_array = calculate_race.minutes_array
    average_time_result = calculate_race.average_time # (collected_minutes_in_array)

    it 'can calculate average race times from the array' do
      expect(collected_minutes_in_array).to eq([240, 241])
      expect(average_time_result).to eq(241)
    end
  end

  context "One race time" do
    final_time = ["12:00 AM, DAY 2"]
    calc_one_boat_time = AverageRaceTimes.new
    converted_time = calc_one_boat_time.array_of_final_times(final_time)

    time_in_array = calc_one_boat_time.minutes_array
    average = calc_one_boat_time.average_time # (time_in_array)

    it 'calculates the average of the one sail boat time' do
      expect(time_in_array).to eq([960])
      expect(average).to eq(960)
    end
  end

  context "Multiple race times" do
    race_times = ["02:00 PM, DAY 19", "02:00 PM, DAY 20", "01:58 PM, DAY 20"]
    calc_race_times = AverageRaceTimes.new

    calc_race_times.array_of_final_times(race_times)
    collected_minutes_in_array = calc_race_times.minutes_array
    avg_of_three_boat_times = calc_race_times.average_time # (collected_minutes_in_array)

    it 'can calculate average race times from the array' do
      expect(collected_minutes_in_array).to eq([26280, 27720, 27718])
      expect(avg_of_three_boat_times).to eq(27239)
    end
  end

  context "Multiple race times" do
    race_times = ["02:34 PM, DAY 23", "12:23 AM, DAY 32"]
    calc_race_times = AverageRaceTimes.new

    calc_race_times.array_of_final_times(race_times)
    collected_minutes_in_array = calc_race_times.minutes_array
    avg_of_three_boat_times = calc_race_times.average_time # (collected_minutes_in_array)

    it 'can calculate average race times from the array' do
      expect(collected_minutes_in_array).to eq([32074, 44183])
      expect(avg_of_three_boat_times).to eq(38129)
    end
  end
end