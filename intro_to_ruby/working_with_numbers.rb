# Вариант 3.
# Метод 1. Найти максимальный простой делитель числа.

def checking(a)
  return false if a <= 1
  return true if a == 2
  (2..Math.sqrt(a)).each do |j|
    return false if a % j == 0
  end
  true
end

def max_found(n)
  max_prime = -1

  (2..Math.sqrt(n)).each do |i|
    if n % i == 0 && checking(i)
      max_prime = i
    end
    if n % i == 0 && checking(n / i)
      max_prime = n / i
    end
  end
  max_prime = n if checking(n)
  max_prime
end

print "Введите число: "
number = gets.chomp.to_i
puts "Максимальный простой делитель: #{max_found(number)}"

# Метод 2. Найти произведение цифр числа, не делящихся на 5.

def found(a)
  res = 1
  while a > 0 do
    if a % 10 % 5 != 0 
      res *= a % 10
    end
    a /= 10
  end
  
  if res == 1
    return 0
  else
    return res
  end
end

print "Введите число: "
number = gets.chomp.to_i
result = found(number)
if result == 0
  puts "Таких цифр нет"
else
  puts "Произведение цифр числа, не делящихся на 5: #{result}"
end

# Метод 3 Найти НОД максимального нечетного непростого делителя числа и произведения цифр данного числа.

def nod(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

def summ(a)
  res = 1
  while a > 0 do
    res *= a % 10
    a /= 10
  end
  return res
end

def maxi_found(n)
  max_res = -1
  (3..n).step(2).each do |i|  
    if n % i == 0
      if !checking(i)
        max_res = [max_res, i].max
      end
    end
  end
  max_res
end

print "Введите число: "
number = gets.chomp.to_i
result = maxi_found(number)
sum=summ(number)

puts "Произвдеение цифр числа: #{sum}"
if result == -1
  puts "Нет нечетных непростых делителей"
else
  puts "Ответ: #{result}"
end

answer = nod(sum, result)
puts "НОД: #{answer}"
