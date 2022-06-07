class CargoWagon < Wagon
  def initialize(number, _type, _manufacturer, volume)
    super(number, 'cargo', volume)
  end

  def reserved_place(count)
    raise 'Мест для бронирования нет!' if (free_place - count).negative?

    super(count)
  end
end