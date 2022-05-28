require_relative 'route'
require_relative 'train'
require_relative 'station'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'

s_f = Station.new('first')
s_s = Station.new('second')
s_th = Station.new('third')
r = Route.new('1', s_f, s_th)
r.add_intermediate_station(s_s)
puts r.inspect
w1 = Wagon.new('1', 'passenger', 'terr')
w2 = Wagon.new('2', 'cargo', 'terr')
w3 = Wagon.new('3', 'passenger', 'terr')
w4 = Wagon.new('4', 'cargo', 'terr')
w5 = Wagon.new('5', 'passenger', 'terr')
w6 = Wagon.new('6', 'cargo', 'terr')
train = PassengerTrain.new('1133')
train.add_wagon(w1)
train.add_wagon(w3)
train.add_wagon(w5)
train_cargo_name = '1111111111'
train_cargo = CargoTrain.new(train_cargo_name)
train_cargo.add_wagon(w2)
train_cargo.add_wagon(w4)
train_cargo.add_wagon(w6)
puts train_cargo.inspect
puts train.inspect
train = PassengerTrain.new('1133')
train.delete_wagon(w1)
train.delete_wagon(w3)
train.delete_wagon(w5)
train_cargo = CargoTrain.new(train_cargo_name)
train_cargo.delete_wagon(w2)
train_cargo.delete_wagon(w4)
train_cargo.delete_wagon(w6)
puts train_cargo.inspect
puts train.inspect

@trains = []
add_train = '111111111111555'
add_train2 = '111111111111666'
train2 = CargoTrain.new(add_train)
      @trains << train2
train3 = PassengerTrain.new(add_train2)
      @trains << train3

puts @trains