require_relative 'Student_class'

student1 = Student.new(1, "Ivan", "Ivanov", "Ivanovich", phone: "+79881677818", telegram: "@ivanovv", email: "ivanov@example.com", github: "ivanov123")
student2 = Student.new(2, "Maria", "Petrova", "Sergeevna", phone: "89881677818", github: "mariapet")
student3 = Student.new(3, "Sergey", "Sidorov", "Alexandrovich", telegram: "@sidorov")

puts student1
puts student2
puts student3