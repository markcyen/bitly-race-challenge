class Conversion
  attr_reader :array_of_hashes

  def initialize()
    @array_of_hashes = []
  end

  def final_convert(string)
    # if Validate.final_check?(string)
    # put in an instance of check?
      converted_time = Validate.time_to_hash(string)
      # binding.pry
      # converted_time[:minute] = converted_time[:minute].to_i
      converted_time[:meridiem] = converted_time[:meridiem].tr(",", "")
      # converted_time[:day] = converted_time[:day].to_i
      if converted_time[:hour] == 12
        converted_time[:hour] = 0
      # else
      #   converted_time[:hour] = converted_time[:hour]
      end
    # end
    @array_of_hashes << converted_time
  end
end
