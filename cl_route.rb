#require "./cl_station"
class Route
  attr_accessor :substation, :route

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @route = [@start_station, @end_station]
  end

  def add_station_after(substation_before, substation)
    index_before = @route.index(substation_before)
    #puts "index_before = #{index_before}"
    @route.insert(index_before+1, substation)
  end

  def del_station_from_route(substation)
    @route.delete(substation)
  end

  def display
    puts "route = #{@route}"
  end
=begin 
  def train_on_route(number, start_station)
  	puts "Train #{@number} at #{@start_station} went to route #{@route}"
  end
=end

end

#route1 = Route.new('Irkutsk', 'Moscow')
#route1.display
#route1.add_station_after('Irkutsk', 'Yurga')
#route1.display
#route1.add_station_after('Yurga', 'Novosib')
#route1.display
#route1.add_station_after('Novosib', 'Kazan')
#route1.display
#route1.del_station_from_route('Kazan')
#route1.display