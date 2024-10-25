class Parent_student
  
  attr_reader :name, :surname, :lastname

  def initialize(name, surname, lastname)
    self.name = name
    self.surname = surname
    self.lastname = lastname
  end

  def name=(name)
    if self.class.valid_names?(name)
      @name = name
    else
      raise ArgumentError, "неверный формат имени: #{name}"
    end
  end

  def surname=(surname)
    if self.class.valid_names?(surname)
      @surname = surname
    else
      raise ArgumentError, "неверный формат фамилии: #{surname}"
    end
  end

  def lastname=(lastname)
    if self.class.valid_names?(lastname)
      @lastname = lastname
    else
      raise ArgumentError, "неверный формат отчества: #{lastname}"
    end
  end

  def full_name
    "#{@surname} #{@name[0]}#{'.'}#{@lastname[0]}"
  end

  def self.valid_names?(name)
    name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end
end
