require_relative 'student'
require_relative 'student_short'
require_relative './data_models/data_list_student_short.rb'
require_relative 'student_list_yaml'
require_relative 'student_list_json'

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
student1 = Student.new(id: 1, name: "Ivan", surname: "Ivanov", lastname: "Ivanovich", phone: "+79881677818", telegram: "@ivanovv", email: "ivanov@example.com", github: "https://github.com/user-name_123")
student2 = Student.new(id: 2, name: "Maria", surname: "Petrova", lastname: "Sergeevna", phone: "89881677818", github: "https://github.com/marry")
# student3 = Student.new(id: 3, name: "Sergey", surname: "Sidorov", lastname: "Alexandrovich", telegram: "@serjj", github: "https://github.com/serj")

# puts student1.full_name
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

# puts test.get_data()
students_list = StudentsListJSON.new('students.json')
# students_list.delete_student_by_id(1)
puts students_list.students
new_student = Student.new(id: 5, name: "Sergey", surname: "Sidorov", lastname: "Alexandrovich", telegram: "@serjj", github: "https://github.com/serj")
students_list.add_student(new_student)

puts 
# puts students_list.sort_by_surname_fullname!

students_list.save_to_file

# data_list = students_list.get_k_n_student_short_list(1, 3)
# puts data_list.get_data()
