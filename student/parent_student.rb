class Parent_student
  
  attr_reader :name, :surname, :lastname

  def initialize(id: nil, github: nil)
    @id=id
    self.github=github
  end

  def github=(github)
    if github.nil? || Student.valid_github?(github)
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

  def github_available?
    !@github.nil? && !@github.empty?
  end

  def contacts_available?
    !(@phone.nil? || @phone.empty?) || 
    !(@telegram.nil? || @telegram.empty?) || 
    !(@email.nil? || @email.empty?)
  end

  def validate_contacts
    github_available? && contacts_available?
  end

  def full_name
    @fullname = "#{@surname} #{@name[0]}#{'.'}#{@lastname[0]}#{'.'}"
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
    details.empty? ? "нет доступной информации" : details.join(', ')
  end 
end