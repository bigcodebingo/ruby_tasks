require_relative 'parent_student_class'

class Student_short < Parent_student

  attr_reader :id, :fio, :git, :contact

  def initialize(student: nil, id: nil, info_str: nil)
    if student
      @id = student.id
      @fio = student.full_name  
      @git = student.github  
      @contact = student.get_contacts
    elsif id && info_str
      @id = id
      parsed_info = parse_info(info_str)
      @fio = parsed_info[:fio]
      @git = parsed_info[:git]
      @contact = parsed_info[:contact]
      else
        raise ArgumentError, "необходимо передать либо объект Student, либо id и info_str"
    end
  end

  private def parse_info(info_str)
    parts = info_str.split(", ")
    fio = parts[0]
    git = parts[1].split("github: ")[1] if parts[1]
    contact = parts[2].split("contacts: ")[1] if parts[2]
    { fio: fio, git: git, contact: contact }
  end

  def to_s
    "id: #{@id}, fullname: #{@fio}, git: #{@git || 'empty'}, contacts: #{@contact || 'empty'}"
  end
end
