require_relative 'spec_helper'

RSpec.describe "Conversion" do
  context "Convert string" do
    final_time = "12:00 AM, DAY 2"
    race = Conversion.new

    it 'converts time into proper datatypes in a hash after valid checks' do
      race_time_hash = race.final_convert(final_time)
      actual = [{
        hour: 0,
        minute: 0,
        meridiem: "AM",
        day: 2
      }]
      expect(race_time_hash).to be_an(Array)
      expect(race_time_hash.first).to be_a(Hash)
      expect(race_time_hash).to eq(actual)
    end
  end

  context "Shovel time hash" do
    final_time_1 = "12:00 AM, DAY 2"
    final_time_2 = "12:01 PM, DAY 2"
    final_time_3 = "08:45 AM, DAY 2"
    race = Conversion.new
    race.final_convert(final_time_1)
    race.final_convert(final_time_2)
    race.final_convert(final_time_3)

    it 'can shovel time hashes into an array' do
      actual = [
        {:hour=>0, :minute=>0, :meridiem=>"AM", :day=>2},
        {:hour=>0, :minute=>1, :meridiem=>"PM", :day=>2},
        {:hour=>8, :minute=>45, :meridiem=>"AM", :day=>2}
      ]
      expect(race.array_of_hashes.size).to eq(3)
      expect(race.array_of_hashes).to eq(actual)
    end
  end
end
