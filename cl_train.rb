#require "cl_route"
class Train
  attr_accessor :number, :brake
  attr_accessor :carri, :speed
  #attr_writer :type
  def initialize (number, carri, type, speed = 0)
    @number = number
    @carri = carri
    @type = type
    @speed = speed
  end
  
  def display_train_info (number)
    puts "Train #{@number} has #{@carri} railway_carriages. Type of train: #{@type}. Train has speed #{@speed}"
  end
  def carri_add
  	@carri = @carri + 1
  end
  def carri_del
  	if @speed == 0 
  		@carri = @carri - 1
  	elsif 
  		puts "Train on route. Speed = #{@speed}"
    end
  end
  def brake
    	@speed = 0
  	puts "Train stopped!"
  end
end

train1 = Train.new('182', 2, 'pass')
train1.display_train_info (182)
train1.carri_add 
train1.speed = 10 
train1.display_train_info (182)
train1.brake
train1.carri_del
train1.display_train_info (182)
