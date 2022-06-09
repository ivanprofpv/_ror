module InstanceCounter
  def self.include(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :instances

  def current
    @current ||= []
  end
  
  private

  attr_writer :instances
end

  module InstanceMethods
    private

    # send вызывает метод instances и показывает текущее значение
    def register_instance
      self.class.current << self
      self.class.send(:instances=, self.class.current.size)
    end
  end
end
