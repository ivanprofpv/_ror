require_relative 'route'
require_relative 'train'
require_relative 'station'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'

valid_train_cargo = CargoTrain.new('ВВГ-22')
valid_train_cargo = PassengerTrain.new('ВВГ-33')

valid_route = Route.new('qqqq', 'asasas', 'asdasd')