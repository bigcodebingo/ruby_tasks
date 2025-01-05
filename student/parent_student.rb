class Parent_student
  
  attr_accessor :id
  attr_reader :github, :fullname

  def initialize(id: nil, github: nil)
    @id=id
    self.github=github
  end

  def github=(github)
    if github.nil? || self.class.valid_github?(github)
      @github = github
    else
      raise ArgumentError, "неверный формат github: #{github}"
    end
  end

  def self.valid_fullname?(fullname)
    fullname.match?(/\A([А-Яа-яЁёA-Za-z]+)\s([А-Яа-яЁёA-Za-z])\.([А-Яа-яЁёA-Za-z])\.\z/)
  end

  def self.valid_github?(github)
    github.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9_-]+\z/)
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

  def github_available?
    !@github.nil? && !@github.empty?
  end

  def contacts_available?
    !(@phone.nil? || @phone.empty?) || 
    !(@telegram.nil? || @telegram.empty?) || 
    !(@email.nil? || @email.empty?) ||
    !(@contact.nil? || @contact.empty?)
  end

  def validate_contacts
    github_available? && contacts_available?
  end

  def get_contact
    if contacts_available?
      contacts = []
      contacts << "phone: #{@phone}" if @phone
      contacts << "telegram: #{@telegram}" if @telegram
      contacts << "email: #{@email}" if @email
      contacts << "#{@contact}" if @contact
      return contacts[0]
    else 
      return nil
    end
  end

  def to_s
    details = []
    details << "#{@id}" if @id
    details << "#{@name}" if @name
    details << "#{@surname}" if @surname
    details << "#{@lastname}" if @lastname
    details << "#{@fullname}" if @fullname
    details << "#{@phone}" if @phone
    details << "#{@telegram}" if @telegram
    details << "#{@email}" if @email
    details << "#{@github}" if @github
    details << "#{@contact}" if @contact
    details.join(', ')
  end 
end
