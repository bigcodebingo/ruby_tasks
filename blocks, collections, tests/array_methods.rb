def global_max_check?(array,index)
    return array[index] == array.max
end

def local_min_check?(array, index)
    left = index > 0 ? array[index - 1] : Float::INFINITY
    right = index < array.size - 1 ? array[index + 1] : Float::INFINITY
    array[index] < left && array[index] < right 
end

def cyclic_shift(array)
    return array if array.empty? || array.size == 1
    first = array.shift  
    array.push(first)
end

def separate_even_odd_index(array)
    even = array.select.with_index { |_, index| index.even? }
    odd = array.select.with_index { |_, index| index.odd? }
    (even + odd).join(' ')
end

def new_lists(array)
    l1 = array.uniq
    l2 = l1.map{ |element| array.count(element) }
    return l1, l2
end

def from_keyboard
    puts "введите элементы массива:"
    array = gets.chomp.split.map(&:to_i)    
end

def read_array(path)
  begin
    file = File.open(path, "r")
    array = file.read.split.map(&:to_i)
    file.close
    array
  end
end

if ARGV.empty?
  array = from_keyboard
else
  path = ARGV[0]
  array = read_array(path)
end

puts "выберите метод"
puts
puts "1. global_max_check"
puts "2. local_min_check"
puts "3. cyclic_shift"
puts "4. separate_even_odd_index"
puts "5. new_lists"
puts 
puts "ваш выбор:"
choice = gets.chomp.to_i

case choice
when 1
  puts "введите индекс элемента для проверки:"
  index = gets.chomp.to_i
  puts global_max_check?(array, index)
when 2
  puts "введите индекс элемента для проверки:"
  index = gets.chomp.to_i
  puts local_min_check?(array, index)
when 3
  puts cyclic_shift(array).inspect
when 4
  puts separate_even_odd_index(array)
when 5
  l1, l2 = new_lists(array)
  puts "l1: #{l1.inspect}"
  puts "l2: #{l2.inspect}"
else
  puts "неверный выбор"
end