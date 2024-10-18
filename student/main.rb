require_relative 'Student_class'
require_relative 'Student_short_class'

student1 = Student.new(1, "Ivan", "Ivanov", "Ivanovich", phone: "+79881677818", telegram: "@ivanovv", email: "ivanov@example.com", github: "https://github.com/user-name_123")
student2 = Student.new(2, "Maria", "Petrova", "Sergeevna", phone: "89881677818", github: "https://github.com/marry")
student3 = Student.new(3, "Sergey", "Sidorov", "Alexandrovich",telegram: "@serjj", github: "https://github.com/serj")

puts student1
puts student2
puts student3
puts ""
student1.set_contacts(phone: '+79009998877', telegram: '@ivanov')
puts student1
puts ""
puts student1.get_contacts
puts ""
student_short1 = Student_short.new(student: student1)
puts student_short1
info_str=student2.getInfo
student_short2 = Student_short.new(id: 2, info_str: info_str)
puts ""
puts student_short2