require "./cl_route.rb"
class Train
  attr_accessor :number, :carriage, :speed
  def initialize(number, carriage, type, speed = 0, train_pos_now = 'Depo')
    @number = number
    @carriage = carriage
    @type = type
    @speed = speed
    @position = []
    @train_pos_now = train_pos_now
  end
  
  def display_train_info(number)
    puts "Train #{@number} has #{@carriage} railway_carriages. Type of train: #{@type}. Train has speed #{@speed}"
  end
  def carriage_add
  	if @speed != 0 
  	  puts "Carriage cannot be added! Speed = #{@speed}"
  	else 
  	  @carriage = @carriage + 1
  	  puts "Carriage has been added. Train has #{@carriage} railway_carriages now." 
    end
  end
  def carriage_del
  	if @speed != 0 
  	  puts "Train on route. Speed = #{@speed}"
  	elsif @carriage > 0
  	  @carriage = @carriage - 1
  	  puts "Carriage has been deleted. Train has #{@carriage} railway_carriages now."   			
    else 
  	  puts "Carriage hasn't railway_carriages."   			
    end
  end

  def brake
    @speed = 0
  	puts "Train stopped!"
  end
  
  def speed_up(speed_up)
  	@speed += speed_up
  end
  def train_on_route(number, station) # получаем маршрут - массив из route
  	station.each { |stat| @position << stat } # переписываем маршрут в position для дальнейшей работы
  	puts @position
  	puts "Train #{@number} arrived at #{@position[0]}"
    self.brake
   @train_pos_now = 0
  puts "position of train is  #{ @position[@train_pos_now]}" # фиксируем точку маршрута
  end
  def train_arrive_next(number, station)
    puts "position of train is  #{ @position[@train_pos_now]}"
    @train_pos_now += 1
    puts "train_posnow = #{@train_pos_now}"
    next_stat = @position[@train_pos_now+1]
    last_stat = @position[@train_pos_now-1]

    puts "Next station is #{next_stat}"
    puts "Last station is #{last_stat}"
    #puts "Train from #{position[0]} arrived to #{position[2]}"
  end

end
=begin
train1.display_train_info (182)
train1.carriage_add 
train1.speed = 10 
train1.display_train_info (182)
train1.brake
train1.carriage_del
train1.display_train_info (182)
train1.speed_up(50)
train1.display_train_info (182)
train1.brake
train1.carriage_del
train1.carriage_del
train1.carriage_del
train1.display_train_info (182)
train1.carriage_add
train1.speed_up(20)
train1.carriage_add
#train1.train_on_route()
=end
train1 = Train.new('182', 2, 'pass')
train1.display_train_info (182)
route1 = Route.new('Irkytsk', 'Ylan-Yde')
route1.display
route1.add_station_after('Irkytsk', 'Slyudyanka')
route1.add_station_after('Irkytsk', 'Nadim')
route1.add_station_after('Nadim', 'Beregovaya')
train1.train_on_route(182, route1.route)
route1.display
train1.train_arrive_next(182, route1.route)
train1.train_arrive_next(182, route1.route)
train1.train_arrive_next(182, route1.route)


