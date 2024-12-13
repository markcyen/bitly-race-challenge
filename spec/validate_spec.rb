require_relative 'spec_helper'

RSpec.describe "Validate Times" do

  # change to include initial check of string
  # *****************************************
  context "Initial validation" do
    it 'checks valid string' do
      time = "12:00 AM, DAY 2"
      expect(Validate.initial_check?(time)).to eq(true)
    end

    it 'sad path checks for edge case on size of string' do
      time = "12:00 AM, DAY 100"
      expect(Validate.initial_check?(time)).to eq(false)

      time_2 = "12:00 AM, DAY2"
      expect(Validate.initial_check?(time_2)).to eq(false)
    end

    it 'sad path checks for edge case on colon in third element of string' do
      time = "12x00 AM, DAY 2"
      expect(Validate.initial_check?(time)).to eq(false)
    end

    it 'sad path checks for edge case on meridiem of string' do
      time = "12:00 xp, DAY 2"
      expect(Validate.initial_check?(time)).to eq(false)
    end

    it 'sad path checks for edge case on DAY of string' do
      time = "12:00 AM, new 2"
      expect(Validate.initial_check?(time)).to eq(false)
    end
  end

  context "Valid digits" do
    it 'checks for valid digits of hour, minute, and day' do
      time = "12:00 AM, DAY 2"
      expect(Validate.valid_digits?(time)).to eq(true)
    end

    it 'sad path checks if hour is not adigit' do
      time = "2x:00 AM, DAY 2"
      expect(Validate.valid_digits?(time)).to eq(false)
    end

    it 'sad path checks if minute is not a digit' do
      time = "43:x4 AM, DAY 2"
      expect(Validate.valid_digits?(time)).to eq(false)
    end

    it 'sad path checks if day is not a digit' do
      time = "43:94 AM, DAY 9x"
      expect(Validate.valid_digits?(time)).to eq(false)
    end
  end
  # *****************************************

  context "Setup time" do
    it 'sets up time as a hash' do
      time = "12:00 AM, DAY 2"
      actual = {hour: 12, minute: 0, meridiem: "AM", day: 2}
      expect(Validate.time_to_hash(time)).to eq(actual)
    end
  end

  context "Valid times" do
    it "checks if time is valid" do
      time = "12:00 AM, DAY 2"
      expect(Validate.valid_time?(time)).to eq(true)
    end

    it "sad path checks if hour is invalid" do
      time = "13:00 AM, DAY 2"
      expect(Validate.valid_time?(time)).to eq(false)

      time_2 = "00:00 AM, DAY 2"
      expect(Validate.valid_time?(time_2)).to eq(false)
    end

    it "sad path checks if minute is valid" do
      time = "12:94 AM, DAY 2"
      expect(Validate.valid_time?(time)).to eq(false)

      time_2 = "12:-1 AM, DAY 2"
      expect(Validate.valid_time?(time_2)).to eq(false)
    end

    it "sad path checks if day is valid" do
      time = "12:00 AM, DAY 0"
      expect(Validate.valid_time?(time)).to eq(false)

      time_2 = "12:00 AM, DAY 100"
      expect(Validate.valid_time?(time_2)).to eq(false)
    end
  end

  context "Compared with start time" do
    it 'checks if finished time is after start time' do
      time = "08:01 AM, DAY 1"
      expect(Validate.final_check?(time)).to eq(true)
    end
    
    it 'sad path checks if finished time same as start time' do
      time = "08:00 AM, DAY 1"
      expect(Validate.final_check?(time)).to eq(false)
    end

    it 'sad path checks if finished time is before start time' do
      time = "07:59 AM, DAY 1"
      expect(Validate.final_check?(time)).to eq(false)

      time_2 = "12:59 AM, DAY 1"
      expect(Validate.final_check?(time_2)).to eq(false)
    end
  end
end
