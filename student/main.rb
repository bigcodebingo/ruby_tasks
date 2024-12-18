require_relative 'student'
require_relative 'student_short'
require_relative 'parent_student'

student1 = Student.new(id: 1, name: "Ivan", surname: "Ivanov", lastname: "Ivanovich", phone: "+79881677818", telegram: "@ivanovv", email: "ivanov@example.com", github: "https://github.com/user-name_123")
student2 = Student.new(id: 2, name: "Maria", surname: "Petrova", lastname: "Sergeevna", phone: "89881677818", github: "https://github.com/marry")
student3 = Student.new(id: 3, name: "Sergey", surname: "Sidorov", lastname: "Alexandrovich", telegram: "@serjj", github: "https://github.com/serj")

puts student1
puts student2
puts student3
puts ""
puts student1.getInfo
student_short = Student_short.init_from_student(student1)
puts ""
puts student_short
info_str=student2.getInfo
puts info_str
puts ""
student_short2 = Student_short.init_from_info(2, info_str)
puts student_short2
puts ""
puts student_short.fullname
puts student_short2.get_contact
