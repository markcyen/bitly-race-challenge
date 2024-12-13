class Validate
  START_TIME = {
    hour: 8,
    minute: 0,
    meridiem: "AM",
    day: 1
  }

  class << self
    # change to include initial check
    # *******************************
    def initial_check?(string)
      (
        (string.size == 15 || string.size == 16) &&
        string[2] == ":" && 
        string[6..8].upcase.match?(/(AM,|PM,)/) && 
        string[10..12].upcase == "DAY"
      ) ? (return true) : (return false)
    end

    def valid_digits?(string)
      if initial_check?(string)
        string_array = string.split
        hh = string_array.first.split(":").first
        mm = string_array.first.split(":").last
        day = string_array.last

        (
          (hh !~ /\D/) && (mm !~ /\D/) && (day !~ /\D/)
        ) ? (return true) : (return false)
      end
    end
    # *******************************

    def time_to_hash(string) # convert_time_to_hash
      @time_hash = {}
      string_array = string.split
      hour_minute = string_array.first.split(":")
      @time_hash[:hour] = hour_minute.first.to_i
      @time_hash[:minute] = hour_minute.last.to_i
      @time_hash[:meridiem] = string_array[1].upcase.tr(",", "")
      @time_hash[:day] = string_array.last.to_i
      @time_hash
    end

    def valid_time?(string)
      # changed to include valid_digits?(string)
      if valid_digits?(string)
        time_to_hash(string)

        # move to helper method exclude && meridiem.match?(/(am|AM|pm|PM)/))
        # if (@time_hash[:hour] !~ /\D/ && @time_hash[:minute] !~ /\D/ && @time_hash[:day] !~ /\D/)

        (
          (@time_hash[:hour] > 0 && @time_hash[:hour] <= 12) && 
          (@time_hash[:minute] >= 0 && @time_hash[:minute] < 60) && 
          (@time_hash[:day] > 0 && @time_hash[:day] < 100)
        ) ? (return true) : (return false)
        # else 
        #   return false
        # end
      else
        return false
      end
    end

    def final_check?(string)
      if valid_time?(string)
        time_to_hash(string)
        hh = @time_hash[:hour]
        mm = @time_hash[:minute]
        meridiem = @time_hash[:meridiem]
        day = @time_hash[:day]

        (
          (day == START_TIME[:day]) && 
          (meridiem.match?(/(#{START_TIME[:meridiem]})/)) && 
          (
            (hh == 12 || hh < START_TIME[:hour]) || 
            (hh == START_TIME[:hour] && mm == START_TIME[:minute])
          )
        ) ? (return false) : (return true)
      else
        return false
      end
    end
  end
end
