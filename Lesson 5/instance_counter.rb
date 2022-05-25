module InstanceCounter

  def self.include(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :instances
  end

  module InstanceMethods

    protected
    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end

  end

end