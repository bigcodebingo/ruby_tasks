require_relative 'parent_student_class'

class Student < Parent_student

  attr_reader :id, :phone, :telegram, :email, :github

  def initialize(id: nil, name: , surname: , lastname: , phone: nil, telegram: nil, email: nil, github: nil)
    super(id: id, github:github)  
    self.name=name
    self.surname=surname
    self.lastname=lastname
    set_contacts(phone: phone, telegram: telegram, email: email)
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

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end

  def get_contacts
    contacts = []
    contacts << "телефон: #{@phone}" if @phone
    contacts << "telegram: #{@telegram}" if @telegram
    contacts << "email: #{@email}" if @email
    contacts.empty? ? "контакты отсутствуют" : contacts.join(', ')
  end

  def getInfo
    "#{full_name}, github: #{@github}, contacts: #{get_contacts}"
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

  def self.valid_names?(name)
    name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end
end