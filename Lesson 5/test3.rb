#ВОТ ТАК РАБОТАЕТ:


def create_train
    puts "В этом меню создаются поезда."
    puts "Введите номер поезда: "
    train = gets.chomp
    puts "Выберите тип добавляемого поезда - 'passenger' или 'cargo'"
    train_type = gets.chomp

    if train == 'cargo'
      add_train(CargoTrain.new(train))
    else
      add_train(PassengerTrain.new(train))
    end
    
    puts "Поезд под номером #{train} добавлен!"
    line
  end

  def add_train(train)
    @trains << train
  end


#ВОТ ТАК НЕ РАБОТАЕТ (НЕ ПЕРЕДАЕТ ДАННЫЕ):

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
  end