require_relative 'student'
require_relative 'student_short'
require_relative './data_models/data_list_student_short.rb'
require_relative './strategy/student_list_yaml'
require_relative './strategy/student_list_json'
require_relative './strategy/student_list'
require_relative './database/student_list_db'
require_relative './view/student_list_view'
require 'fox16'

include Fox

if __FILE__ == $0
    app = FXApp.new
    StudentApp.new(app)
    app.create
    app.run
  end

# puts student1
# puts student2
# puts student3
# puts ""
# puts student1.getInfo
# student_short = Student_short.init_from_student(student1)
# puts ""
# puts student_short
# info_str=student2.getInfo
# puts info_str
# puts ""
# student_short2 = Student_short.init_from_info(2, info_str)
# puts student_short2
# puts ""
# puts student_short.fullname
# puts student_short2.get_contact

# table = DataTable.new([[]])
# data_list_1 = DataListStudentShort.new([student_short, student_short2])
# names = data_list_1.get_names()
# puts names
# student1 = Student.new(id: 30, name: "Ivan", surname: "Ivanov", lastname: "Ivanovich", phone: "+79881677818", telegram: "@ivanovv", email: "ivanov@example.com", github: "https://github.com/user-name_123")
# student2 = Student.new(id: 2, name: "Maria", surname: "Petrova", lastname: "Sergeevna", phone: "89881677818", github: "https://github.com/marry")
# student3 = Student.new(id: 3, name: "Sergey", surname: "Sidorov", lastname: "Alexandrovich", telegram: "@serjj", github: "https://github.com/serj")

# st1_info = student1.getInfo
# st2_info = student2.getInfo
# st3_info = student3.getInfo

# short_st1 = Student_short.init_from_info(1, st1_info)
# short_st2 = Student_short.init_from_info(2, st2_info)
# short_st3 = Student_short.init_from_info(3, st3_info)

# puts short_st1.get_contact
# puts short_st1
# puts short_st2
# puts short_st3

# test = DataListStudentShort.new([
#     short_st1 = Student_short.init_from_info(1, st1_info),
#     short_st2 = Student_short.init_from_info(2, st2_info),
#     short_st3 = Student_short.init_from_info(3, st3_info)
# ])

# puts test.count
# students_list = StudentsListJSON.new('students.json')
# students_list.delete_student_by_id(1)
# puts students_list.students
# new_student = Student.new(id: 5, name: "Sergey", surname: "Sidorov", lastname: "Alexandrovich", telegram: "@serjj", github: "https://github.com/serj")
# students_list.add_student(new_student)

# puts students_list.sort_by_surname_fullname!

# students_list.save_to_file

# data_list = students_list.get_k_n_student_short_list(1, 3)
# puts data_list.get_data()

# json_strategy = StudentsListJSON.new
# students_list = StudentsList.new('students.json', json_strategy)

# # students_list.sort_by_fullname!
# # students_list.save_to_file
# data_list=students_list.get_k_n_student_short_list(1,12)
# data_table = data_list.get_data
# puts data_table
# students_list.add_student(Student.new(id: nil, name: 'Иван', surname: 'Иванович', lastname: 'Иванов'))

# yaml_strategy = StudentsListYAML.new
# students_list.update_strategy('students.yaml', yaml_strategy)
# students_list.add_student(Student.new(id: nil, name: 'Иваныч', surname: 'Иванович', lastname: 'сосал'))

# students_list.save_students

# json_strategy = StudentsListJSON.new
# students_list = StudentsList.new('students.json', json_strategy)

# students_list.delete_student_by_id(2)

# yaml_strategy = StudentsListYAML.new
# students_list.update_strategy('students.yaml', yaml_strategy)

# students_list.save_to_file

# puts student_db.get_student_short_count
# puts student_db.connection

