#Так было и в нем не работала передача в массив trains:

def create_train
    puts "В этом меню создаются поезда."
    puts "Введите номер поезда: "
    train = gets.chomp
    puts "Выберите тип добавляемого поезда - 'passenger' или 'cargo'"
    train_type = gets.chomp

    case train_type
    when :cargo
      add_trains = CargoTrain.new(train)
    when :passenger
      add_trains = PassengerTrain.new(train)
    end
    add_train(add_trains)
    binding.pry
    puts "Поезд под номером #{train} добавлен!"
    line
  end

  def add_train(train)
    @trains << train
  end

#Так я сделал: (как смог придумать)

  def create_train
    puts "В этом меню создаются поезда."
    puts "Введите номер поезда: "
    train = gets.chomp
    puts "Выберите тип добавляемого поезда - 'passenger' или 'cargo'"
    train_type = gets.chomp

    if train_type == 'cargo'
    train_add = CargoTrain.new(train)
    else
    train_add = PassengerTrain.new(train)
    end
    @trains << train_add
    puts "Поезд под номером #{train} добавлен!"
    line
  end
