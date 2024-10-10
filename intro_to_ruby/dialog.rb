print "Укажите ваше имя: "
yourname = gets.chomp

puts "Приветствую, #{yourname}, какой у тебя любимый язык программирования?"
favorite_language = gets.chomp.capitalize

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