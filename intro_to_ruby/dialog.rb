yourname = ARGV[0]

puts "Приветствую, #{yourname}, какой у тебя любимый язык программирования?"
favorite_language = STDIN.gets.chomp.capitalize

case favorite_language
when "Ruby" 
    puts "Ах ты подлиза..."
when "Python" 
    puts "этим ты будешь на другом предмете заниматься"
when "C++" 
    puts "застрял на 1 курсе что ли?"
when "JS" 
    puts "неплохой выбор, но не верный)"
else 
    puts "ладно, не важно, скоро станет Ruby"
end


puts "#{yourname}, введите команду Ruby:"
ruby_command = STDIN.gets.chomp

puts "#{yourname}, введите команду операционной системы:"
os_command = STDIN.gets.chomp

eval(ruby_command)
puts "команда ruby выполнена"
system(os_command)
puts "команда операционной системы выполнена"

