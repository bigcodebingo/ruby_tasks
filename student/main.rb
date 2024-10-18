require_relative 'Student_class'

student1 = Student.new(1, "Ivan", "Ivanov", "Ivanovich", phone: "+79881677818", telegram: "@ivanovv", email: "ivanov@example.com", github: "https://github.com/user-name_123")
student2 = Student.new(2, "Maria", "Petrova", "Sergeevna", phone: "89881677818", github: "https://github.com/marry")
student3 = Student.new(3, "Sergey", "Sidorov", "Alexandrovich",telegram: "@serjj", github: "https://github.com/serj")

puts student1
puts student2
puts student3

student1.set_contacts(phone: '+79009998877', telegram: '@ivanov')

puts student1