class Student

  attr_reader :id, :name, :surname, :lastname
  attr_accessor :phone, :telegram, :email, :github
    
  def initialize(id, name, surname, lastname, **extras)
    @id = id
    self.name = name
    self.surname = surname
    self.lastname = lastname
    self.phone = extras[:phone]
    self.telegram = extras[:telegram]
    self.email = extras[:email]
    self.github = extras[:github]
  end
  
  def self.valid_names?(name)
		name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
	end

  def self.valid_phone?(phone)
    phone.match?(/^(?:\+7|8)\d{10}$/)
  end

  def self.valid_telegram?(telegram)
    telegram.match?(/\A@[\w\d_]{5,32}\z/)
  end

  def self.valid_email?(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def self.valid_github?(github)
    github.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9_-]+\z/)
  end

  def name=(name)
    if Student.valid_names?(name)
      @name = name
    else
      raise ArgumentError, "неверный формат имени: #{name}"
    end
  end

  def surname=(surname)
    if Student.valid_names?(surname)
      @surname = surname
    else
      raise ArgumentError, "неверный формат фамилии: #{surname}"
    end
  end

  def lastname=(lastname)
    if Student.valid_names?(lastname)
      @lastname = lastname
    else
      raise ArgumentError, "неверный формат отчества: #{lastname}"
    end
  end

  def phone=(phone)
    if phone.nil? || Student.valid_phone?(phone) 
      @phone = phone
    else 
      raise ArgumentError, "неверный формат телефона: #{phone}"
    end
  end

  def telegram=(telegram)
    if telegram.nil? || Student.valid_telegram?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "неверный формат Telegram: #{telegram}"
    end
  end

  def email=(email)
    if email.nil? || Student.valid_email?(email)
      @email = email
    else
      raise ArgumentError, "неверный формат email: #{email}"
    end
  end

  def github=(github)
    if github.nil? || Student.valid_github?(github)
      @github = github
    else
      raise ArgumentError, "неверный формат GitHub: #{github}"
    end
  end

  def full_name
    "#{@surname} #{@name[0]}#{'.'}#{@lastname[0]}"
  end

  def to_s
    "id: #{@id}, fullname: #{full_name}, phone: #{@phone || 'empty'}, tg: #{@telegram || 'empty'}, email: #{@email || 'empty'}, git: #{@github || 'empty'}"
  end
end
