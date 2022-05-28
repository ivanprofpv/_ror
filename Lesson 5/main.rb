require 'pry'

require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'

class Main

  attr_reader :stations, :trains, :routes
  attr_accessor :start

  def initialize
   @stations = []
   @trains = []
   @routes = []
  end

  def train_search(number)
    train = trains.select { |i| i.number == number }.last
    return train unless train.nil?
    puts "Нет поездов для отображения!"
  end

  def station_search(name)
    station = @stations.select { |i| i.name == name }.last
    return station unless station.nil?
    puts "Нет станций для отображения!"
  end

  def route_search(route_number)
    route = routes.select { |i| i.route_number == route_number }.last
    return route unless route.nil?
    puts "Нет маршрутов для отображения!"
  end

#в этот метод передаем введенные данные из метода управления 
#маршрутами(и не только) - название станции и номер маршрута
  def search_station_in_route?(station_name, route_number)
    route_number.stations.include?(station_name)
  end

  def line
    puts " "
    puts "==================================="
    puts " "
  end

  def create_station
    puts "В этом меню создаются станции."
    puts "Введите название станции: "
    name = gets.chomp
    add_station(Station.new(name))
    puts "Станция под названием #{name} создана!"
    line
  end

  def show_all_stations_and_trains
    puts "Введите номер маршрута: "
    route = route_search(gets.chomp)
    return if route.nil?

    puts "Станции: "
    route.show_all_station
    line
  end

def create_train
    puts "В этом меню создаются поезда."
    puts "Введите номер поезда: "
    train = gets.chomp
    puts "Выберите тип добавляемого поезда - 'passenger' или 'cargo'"
    train_type = gets.chomp

    case train_type
    when :cargo 
      add_train(CargoTrain.new(train))
    when :passenger 
      add_train(PassengerTrain.new(train))
    end
    puts "Поезд под номером #{train} добавлен!"
    line
  end

     def add_train(train)
    @trains << train
        binding.pry
  end

  def create_route
    puts "В этом меню создаются маршруты."
    puts "Введите название маршрута: "
    route_number = gets.chomp
    puts "Введите название начальной станции: "
    first_station = station_search(gets.chomp)
    puts "Введите название конечной станции: "
    end_station = station_search(gets.chomp)

    add_route(Route.new(route_number, first_station, end_station))
    puts "Маршрут #{route_number} создан!"
    line
  end

  def manage_route
    puts "В этом меню можно добавить или удалить промежуточную станцию."
    puts "Введите номер маршрута для поиска станции: "
    route_number = route_search(gets.chomp)

    puts "Введите название станции для редактирования: "
    station_name = route_search(gets.chomp)

    puts "Введите 'add' для добавления или 'del' для удаления станции: "
    choise = gets.chomp

    station_on_route = search_station_in_route?(station_name, route_number)
    case choise
    when :add 
      if station_on_route
        puts "Вы уже добавляли станцию под этим названием!"
      else
        route_number.add_intermediate_station(intermediate_station)
        puts "Станция #{station_name} успешно добавлена в маршрут #{route_number}!"
      end
    when :del 
      if !station_on_route
        puts "Станции под таким названием нет в маршруте!"
      elsif 
        route_number.stations.first == station_name || route_number.stations.last == station_name
        puts "Станции с таким названием нет в промежуточных станциях маршрута!"
      elsif 
        !station_name.trains.empty?
        puts "Нельзя удалить станцию, на которой есть поезд!"
      else
        route_number.del_intermediate_station(intermediate_station)
        puts "Станция удалена из маршрута!"
      end
      line
    end
  end

  def set_route_for_train
    puts "В этом меню поезду назначается маршрут."
    puts "Введите номер поезда: "
    train = train_search(gets.chomp)
    return if train.nil?

    puts "Введите номер маршрута, который хотите назначить поезду: "
    route = route_search(gets.chomp)
    return if route.nil?

    train.route_assignment(route)
    puts "Маршрут #{route} назначен для поезда #{train}"
    line
  end

  def add_or_del_wagon
    puts "В этом меню поезду можно присоединить вагон или отцепить."
    puts "Введите номер поезда: "
    train = train_search(gets.chomp)

    puts "Введите номер вагона: "
    wagon = gets.chomp

    puts "Введите 'add' для присоединения вагона и 'del' для отцепления вагона от поезда: "
    choise = gets.chomp

    case choise
    when :add 
      train.add_wagon(Wagon.new(wagon, train.type))
      puts "Вагон прицеплен к поезду!"
    when :del 
      wagon = train.wagons.select { |i| i.train == wagon }.last
      if wagon.nil?
        puts "Такого вагона нет!"
      else
      train.delete_wagon(wagon)
      puts "Вагон удален!"
      end
      line
    end
  end

  def moving_next_previous_train
    puts "В этом меню поезд можно отправить вперед на следующую станцию."
    puts "Введите номер поезда: "
    train = train_search(gets.chomp)

    puts "Выберите куда едем: 'next' - вперед или 'back' назад: "
    choise = gets.chomp

    case choise
    when :next
      moved = train.next_station
    when :back
      moved = train.previous_station
    end
      puts moved.nil? ? "Поезд не переехал!" : "Поезд теперь на станции #{current_station}!"
      line
  end

  def add_station(station)
    @stations << station
  end

  def add_route(route)
   @routes << route 
  end

  def start
      loop do
        puts "Меню действий: 
        1. Создать станцию
        2. Создать поезд
        3. Создать маршрут
        4. Управление маршрутами (добавление и удаление промежуточной)
        5. Установить маршрут поезду
        6. Прицепить или отцепить вагон от поезда
        7. Отправить поезд вперед или назад
        8. Показать список станций и поездов
        9. Выход"
        puts "Введите команду цифрой: "

        choise = gets.chomp.to_i
        case choise
        when 1 then create_station
        when 2 then create_train
        when 3 then create_route
        when 4 then manage_route  
        when 5 then set_route_for_train
        when 6 then add_or_del_wagon
        when 7 then moving_next_previous_train
        when 8 then show_all_stations_and_trains
        when 9 then break
        end
      end
    end
end

Main.new.start