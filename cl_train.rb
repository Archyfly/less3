require "./cl_route"
class Train
  attr_accessor :number, :carriage, :speed
  def initialize(number, carriage, type, speed = 0)
    @number = number
    @carriage = carriage
    @type = type
    @speed = speed
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
  def train_on_route(number, station)
  	puts "Train #{@number} at #{@start_station} went to route #{@route}"
  end
end

train1 = Train.new('182', 2, 'pass')
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
