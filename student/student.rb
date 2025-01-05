require_relative 'parent_student'

class Student < Parent_student

  attr_reader  :name, :surname, :lastname, :phone, :telegram, :email

  def initialize(id: nil, name: , surname: , lastname: , phone: nil, telegram: nil, email: nil, github: nil)
    super(id: id, github:github)  
    self.name=name
    self.surname=surname
    self.lastname=lastname
    set_contacts(phone: phone, telegram: telegram, email: email)
  end

  def to_h
    {
      id: @id,
      name: @name,
      surname: @surname,
      lastname: @lastname,
      phone: @phone,
      telegram: @telegram,
      email: @email,
      github: @github
    }
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

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end
  
  private def phone=(phone)
    if phone.nil? || Student.valid_phone?(phone)
      @phone = phone
    else
      raise ArgumentError, "неверный формат телефона: #{phone}"
    end
  end

  private def telegram=(telegram)
    if telegram.nil? || Student.valid_telegram?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "неверный формат telegram: #{telegram}"
    end
  end

  private def email=(email)
    if email.nil? || Student.valid_email?(email)
      @email = email
    else
      raise ArgumentError, "неверный формат email: #{email}"
    end
  end
  
  def full_name
    @fullname = "#{@surname} #{@name[0]}#{'.'}#{@lastname[0]}#{'.'}"
  end

  def getInfo
    "#{full_name}, github: #{@github}, contact: #{get_contact}"
  end

  def self.valid_names?(name)
    name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end
end
