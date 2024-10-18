require_relative 'parent_student_class' 

class Student < Parent_student
  attr_reader :id, :phone, :telegram, :email, :github

  def initialize(id, name, surname, lastname, **extras)
    super(name, surname, lastname)  
    @id = id
    set_contacts(extras)
    validate_contacts
  end

  def self.valid_github?(github)
    github.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9_-]+\z/)
  end

  def set_contacts(extras = {})
    self.github = extras[:github]
    self.phone = extras[:phone]
    self.telegram = extras[:telegram]
    self.email = extras[:email]
  end

  def get_git
    @github || 'git отсутствует'
  end

  def get_contacts
    contacts = []
    contacts << "телефон: #{@phone}" if @phone
    contacts << "telegram: #{@telegram}" if @telegram
    contacts << "email: #{@email}" if @email
    contacts.empty? ? "контакты отсутствуют" : contacts.join(', ')
  end

  def getInfo
    "#{full_name}, github: #{get_git}, связь: #{get_contacts}"
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

  def validate_contacts
    unless github_available?
      raise ArgumentError, "отсутствует github профиль"
    end
    
    unless contacts_available?
      raise ArgumentError, "необходимо указать хотя бы один контакт для связи"
    end
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