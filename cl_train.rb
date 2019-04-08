require "./cl_route.rb"
class Train
  attr_accessor :number, :carriage, :speed
  def initialize(number, carriage, type, speed = 0, train_pos_now = 'Depo')
    @number = number # Номер поезда
    @carriage = carriage # Количество вагонов
    @type = type # Тип поезда
    @speed = speed # Скорость поезда
    @position = [] # для сохранения маршрута и движения по маршруту
    @train_pos_now = train_pos_now # хранение текущей позиции
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
  	puts "Train #{@number} arrived at #{@position[0]}"
    self.brake
    @train_pos_now = 0
    puts "position of train is #{ @position[@train_pos_now]}" # фиксируем точку маршрута
  end
  
  def train_go_to_next(number, station) #поезд перемещается на следующую станцию, выводим куда пеерместился.
    if @position[@train_pos_now] != @position[-1]
      @train_pos_now += 1
      puts "Location of train is #{ @position[@train_pos_now]}"
      next_stat = @position[@train_pos_now+1] #смотрим следующую станцию
      prev_stat = @position[@train_pos_now-1] #смотрим предыдущую станцию
      puts "Next station is #{next_stat}"
      puts "Previous station is #{prev_stat}"
    else 
      puts "Train on last station!"
    end
  end
    
  def train_go_to_previous(number, station) #поезд перемещается на предыдущую станцию, выводим куда пеерместился.
    if @train_pos_now > 0
      @train_pos_now -= 1
      puts "Location of train is  #{ @position[@train_pos_now]}"
      next_stat = @position[@train_pos_now+1] #смотрим следующую станцию
      prev_stat = @position[@train_pos_now-1] #смотрим предыдущую станцию
      puts "Next station is #{next_stat}"
      puts "Previous station is #{prev_stat}"
    else 
      puts "Train at the start of route!"
    end
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
train1.train_go_to_next(182, route1.route)
train1.train_go_to_next(182, route1.route)
train1.train_go_to_next(182, route1.route)
train1.train_go_to_next(182, route1.route)
train1.train_go_to_next(182, route1.route)
train1.display_train_info(182)
train1.train_go_to_previous(182, route1.route)
train1.train_go_to_previous(182, route1.route)
train1.train_go_to_previous(182, route1.route)
train1.train_go_to_previous(182, route1.route)
