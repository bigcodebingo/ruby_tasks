require_relative 'Student_class'

student1 = Student.new(1, "Ivan", "Ivanov", "Ivanovich", phone: "123456789", telegram: "@ivanov", email: "ivanov@example.com", github: "ivanov123")
student2 = Student.new(2, "Maria", "Petrova", "Sergeevna", phone: "987654321", github: "mariapet")
student3 = Student.new(3, "Sergey", "Sidorov", "Alexandrovich", telegram: "@sidorov")

puts student1
puts student2
puts student3