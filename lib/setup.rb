class Setup
  attr_reader :times, :bulk_times

  def initialize()
    @times = []
    # bulk = [] 
    # bulk << @times
    @bulk_times = []
  end

  def legit_input?(race_time)
    Validate.final_check?(race_time)
  end

  def shovel_times(race_time)
    # array = race_time.split
    # if array[2].upcase != "DAY"
    #   array[2].replace("DAY")
    #   @times << array.join(" ")
    # else
    #   @times << race_time.upcase
    # end
    @times << race_time.upcase
  end

  def bulk_times(array_times)
    @bulk_times << array_times
    @bulk_times.flatten # [["", "", ""]]
  end
end
