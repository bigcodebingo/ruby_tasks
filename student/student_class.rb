class Student

  attr_reader :id, :name, :surname, :lastname
  attr_accessor :phone, :telegram, :email, :github
    
  def initialize(id, name, surname, lastname, **extras)
    @id = id
    @name = name
    @surname = surname
    @lastname = lastname
    self.phone = extras[:phone]
    @telegram = extras[:telegram]
    @email = extras[:email]
    @github = extras[:github]
  end
  
  def self.valid_phone?(phone)
    phone.match?(/^(?:\+7|8)\d{10}$/)
  end
  
  def phone=(phone)
    if phone.nil? || Student.valid_phone?(phone) 
      @phone = phone
    else 
      raise ArgumentError, "неверный формат: #{phone}"
    end
  end

  def full_name
    "#{@surname} #{@name[0]}#{'.'}#{@lastname[0]}"
  end

  def to_s
    "id: #{@id}, fullname: #{full_name}, phone: #{@phone || 'empty'}, tg: #{@telegram || 'empty'}, email: #{@email || 'empty'}, git: #{@github || 'empty'}"
  end
end
