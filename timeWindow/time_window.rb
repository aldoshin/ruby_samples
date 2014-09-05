# Defines a time window spanning multiple days and time ranges

# This class defines a Constant Array of the names of the days, 
# based on this array the class builds another array of TimeFrame objects.

# The TimeFrame Array contains all posible time windows used to validate 
# the time received in the method include?.


class TimeWindow
  DAYNAMES = %w(Sun Mon Tue Wed Thu Fri Sat)

  # Creates the array of TimeFrame objects mapping the String received.
  # For each item separeted by a ";" creates and Array of TimeFrame objects,
  # this is why we flatten the result from parse_interval

  # i.e. parse_interval builds an Array of Arrays of TimeFrame i.e. for the 
  # String received "Mon; Sat Sun 0700-0900" the value of frame before the 
  # flatten operation is the array:
  # [[TimeFrame(start = 6, end = nil, times = [])] , [TimeFrame(start = 6, end = nil, times = [0700, 0900]), TimeFrame(start = 0, end = nil, times = [0700, 0900])]]
  def initialize(ranges)
    @frames = ranges.split(";").map { |interval| parse_interval(interval) }.flatten
  end

  
  # Build and Array of Array, for the string the result is "Mon"
  # [TimeFrame(start = 6, end = nil, times = [])] 
  def parse_interval(interval)
    alldays = []
    alltimeintervals = []
    interval.split(" ").each do |token|
      case token
      when /^\D{3}$/
        alldays << [DAYNAMES.index(token)]
      when /^\D{3}-\D{3}$/
        days = token.split("-")
        alldays << [DAYNAMES.index(days[0]), DAYNAMES.index(days[1])]
      when /^\d{4}-\d{4}$/
        timeintervals = token.split("-")
        alltimeintervals << [timeintervals[0] , timeintervals[1]]
      end   
    end
    alldays.map { |daysFrame|  TimeFrame.new(daysFrame[0], daysFrame[1], alltimeintervals) }
  end

  # Verifies if the time received is inside of any Time Frame defined in the frames array.
  # Returns true if the frames is empty or any TimeFrame object includes the time received, false otherwise
  def include?(time)
    @frames.empty? or @frames.any? { |frame| frame.includes(time)}
  end
end

# Helper class used to encapsuled the values of a frame. It defines 
# the start day, end date and an array of arrays of strings used to
# define the time ranges
class TimeFrame

  def initialize(start_day, end_day, times)
    @start_day, @end_day, @times = start_day, end_day, times
  end
  
  # Returns true if the day of the time is on the range of start and end days 
  # and the hour and minute is in any values on the range of the time
  def includes(time)
    includesDay(time.wday) and includesTime(time.strftime("%H%M"))
  end

  # Return true if the start day is nil or the weekDay is inside the 
  # range of created by the start and end day.

  # If the end day is less than start date then the range used to validate the weekDay
  # is the range created for the value of start_day and the value of (end_day + 7)
  # because it assumes that the end_day will be on the next week
  def includesDay(weekDay)
    if !@start_day.nil?
      if @end_day.nil? 
        @start_day == weekDay
      elsif @start_day < @end_day 
        @start_day <= weekDay and weekDay <= @end_day
      else
        @start_day <= weekDay and weekDay <= (@end_day + 7)
      end
    else
      true
    end
  end

  # Returns true if the times array is empty or if the range created for any value
  # inside the times array includes the value of the time_format received
  def includesTime(time_format)
    @times.empty? or @times.any? { |start,finish| start <= time_format && time_format < finish}
  end

  def to_s
    "start = #{@start_day}, end = #{@end_day}, times #{@times}"
  end
end

