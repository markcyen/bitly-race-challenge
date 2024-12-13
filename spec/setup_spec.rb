require_relative 'spec_helper'

RSpec.describe "Setup Times" do
  context "Validate input" do
    setup = Setup.new

    it 'checks if the input is valid' do
      race_time_input = "12:00 AM, DAY 2"
      expect(setup.legit_input?(race_time_input)).to eq(true)
    end

    it 'checks if the input is valid' do
      race_time_input = "skldjklfsdjkldfjds"
      expect(setup.legit_input?(race_time_input)).to eq(false)
    end
  end

  context "Setup on time in array" do
    race_time_input = "12:00 AM, DAY 2"
    another_input = "12:01 AM, DAY 2"
    setup = Setup.new
    setup.shovel_times(race_time_input)
    setup.shovel_times(another_input)

    it 'converts times into an array' do
      expect(setup.times).to eq(["12:00 AM, DAY 2", "12:01 AM, DAY 2"])
    end
  end
end
