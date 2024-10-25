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
puts ""
student_short1 = Student_short.new(id: 1, fullname: "Бачурин И.А.", github: "https://github.com/ivan", contact: "+79881677818")
puts student_short1
puts ""
puts student1.get_contacts
puts ""
student_short = Student_short.init_from_student(student1)
puts ""
puts student_short
info_str=student2.getInfo
puts ""
puts info_str
student_short2 = Student_short.init_from_info(2, info_str)
puts ""
puts student_short2
