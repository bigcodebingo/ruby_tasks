require_relative 'parent_student'
require_relative 'student'

class Student_short < Parent_student

  attr_reader :fullname, :contact

  def initialize(id:, fullname:, github: nil, contact: nil)
    super(id: id, github: github)
    self.fullname = fullname
    @contact = contact
  end

  def self.init_from_student(student)
    new(id: student.id, 
        fullname: student.full_name, 
        github: student.github, 
        contact: student.get_contacts)
  end

  def self.init_from_info(id, info_str)
    parsed_info = parse_info(info_str)
    puts parsed_info
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

  def self.parse_info(info_str)
    parts = info_str.split(", ")
    fullname = parts[0]
    github = parts[1].split("github: ")[1] if parts[1]
    contact = parts[2].split("contacts: ")[1] if parts[2]
    { fullname: fullname, github: github, contact: contact }
  end
end
