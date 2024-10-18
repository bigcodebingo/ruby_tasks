class Student
  attr_reader :id, :name, :surname, :lastname, :phone, :telegram, :email, :github
  
  def initialize(id, name, surname, lastname, **extras)
    @id = id
    self.name = name
    self.surname = surname
    self.lastname = lastname
  
    set_contacts(extras)
    validate
  end
  
  def self.valid_names?(name)
    name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
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

  def set_contacts(extras = {})
    self.github = extras[:github]
    self.phone = extras[:phone]
    self.telegram = extras[:telegram]
    self.email = extras[:email]
  end

  def get_github()
    @github || 'git отсутствует'
  end

  def contact_info()
    contacts = []
    contacts << "телефон: #{@phone}" if @phone
    contacts << "telegram: #{@telegram}" if @telegram
    contacts << "email: #{@email}" if @email
    contacts.empty? ? "контакты отсутствуют" : contacts.join(', ')
  end

  def full_name()
    "#{@surname} #{@name[0]}#{'.'}#{@lastname[0]}"
  end

  def getInfo()
    "#{full_name}, github: #{get_github}, связь: #{contact_info}"
  end

  private def github=(github)
    if github.nil? || Student.valid_github?(github)
      @github = github
    else
      raise ArgumentError, "неверный формат github: #{github}"
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

  def validate
    unless github_available?
      raise ArgumentError, "отсутствует github профиль"
    end
    
    unless contacts_available?
      raise ArgumentError, "необходимо указать хотя бы один контакт для связи"
    end
    true
  end

  def github_available?
    !@github.nil? && !@github.empty?
  end

  def contacts_available?
    !(@phone.nil? || @phone.empty?) || 
    !(@telegram.nil? || @telegram.empty?) || 
    !(@email.nil? || @email.empty?)
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

  def to_s
    "id: #{@id}, fullname: #{full_name}, phone: #{@phone || 'empty'}, tg: #{@telegram || 'empty'}, email: #{@email || 'empty'}, git: #{@github || 'empty'}"
  end

end
