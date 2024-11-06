require_relative 'parent_student'
require_relative 'student'

class Student_short < Parent_student

  attr_reader :contact
  private_class_method :new
  private :github=

  def initialize(id:, fullname:, github: nil, contact: nil)
    super(id: id, github: github)
    self.fullname = fullname
    self.contact = contact
  end

  def self.init_from_student(student)
    new(id: student.id, 
        fullname: student.full_name, 
        github: student.github, 
        contact: student.get_contact)
  end

  def self.init_from_info(id, info_str)
    parsed_info = parse_info(info_str)
    new(id: id,
        fullname: parsed_info[:fullname],
        github: parsed_info[:github],
        contact: parsed_info[:contact])
  end

  private def fullname=(fullname)
    if self.class.valid_fullname?(fullname)
      @fullname = fullname
    else
      raise ArgumentError, "неверный формат ФИО: #{fullname}"
    end
  end

  private def contact=(contact)
    if self.class.valid_contact?(contact)
      @contact = contact
    else
      raise ArgumentError, "неверный формат контакта: #{contact}"
    end
  end

  def self.valid_contact?(contact)
    return true if contact.nil? || contact.empty? 
    info = contact.split(" ")
    case info[0]
    when "phone:"
      Student_short.valid_phone?(info[1]) 
    when "telegram:"
      Student_short.valid_telegram?(info[1]) 
    when "email:"
      Student_short.valid_email?(info[1])
    else
      false
    end
  end

  def self.parse_info(info_str)
    parts = info_str.split(", ")
    fullname = parts[0]
    github = parts[1].split("github: ")[1] if parts[1]
    contact = parts[2].split("contact: ")[1] if parts[2]
    { fullname: fullname, github: github, contact: contact }
  end
end

