require "./cl_train.rb"

class Station
  def initialize(name)
    @name = name
    puts "New station created. Name of station: #{name}"
    @train_on_station = []
  end
  def display_trains_on_station
  	puts "Train on station now is: #{@train_on_station}"
  end
  def train_arrived(number)
    puts "Train arrived on the station #{@name}"
    @train_on_station << number
    puts "Trains on the station now is #{@train_on_station}"

  end
  def train_departure(number)
  	@train_on_station.delete (number)
  	puts "Train #{number} departed from #{@name}"
  end
end

station11 = Station.new("Popovka")
station12 = Station.new("Bologoe")
station13 = Station.new("Elci")
station21 = Station.new("Kolesovo")
station22 = Station.new("Prohorovka")
station23 = Station.new("Narva")

station12.train_arrived(112)
station12.train_arrived(44)
station12.train_arrived(76)

station12.display_trains_on_station
station12.train_departure (76)
train2 = Train.new(54, 8, 'cargo')
station12.train_arrived(train2.number)
train2.brake
station12.display_trains_on_station
