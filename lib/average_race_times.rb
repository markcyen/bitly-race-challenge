class AverageRaceTimes
  attr_reader :minutes_array

  HRS_IN_DAY = 24
  MIN_IN_HOUR = 60
  # START_TIME = {
  #   hour: 8,
  #   minute: 0,
  #   meridiem: "AM",
  #   day: 1
  # }

  def initialize()
    @minutes_array = []
  end

  def average_time # (minutes_array)
    (@minutes_array.sum / @minutes_array.size.to_f).round(0)
  end

  def array_of_final_times(times_array)
    converted = Conversion.new

    times_array.each do |time|
      converted.final_convert(time)
    end

    times_converted = converted.array_of_hashes
    times_converted.each do |time_hash|
      if time_hash[:meridiem].include?("A")
        @minutes_array << calc_for_am(time_hash)
      else
        @minutes_array << calc_for_pm(time_hash)
      end
    end
  end

  def calc_for_am(time_hash)
    (
      (
        (time_hash[:day] - Validate::START_TIME[:day]) * 
        HRS_IN_DAY + 
        (time_hash[:hour] - Validate::START_TIME[:hour])
      ) * MIN_IN_HOUR
    ) + time_hash[:minute]
  end

  def calc_for_pm(time_hash)
    (
      (
        (time_hash[:day] - Validate::START_TIME[:day]) * 
        HRS_IN_DAY + 
        (time_hash[:hour] + 12) - Validate::START_TIME[:hour]
      ) * MIN_IN_HOUR
    ) + time_hash[:minute]
  end
end
