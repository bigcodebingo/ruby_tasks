def find_min(arr)
    min_value = arr[0]
    for i in 1...arr.length
      if arr[i] < min_value
        min_value = arr[i]
      end
    end
    min_value
  end
  
  def first_found(arr)
    for i in 0...arr.length
      return i if arr[i] > 0
    end
    -1 
  end
  
  def read_array(path)
    begin
      file = File.open(path, "r")
      array = file.read.split.map(&:to_i)
      file.close
      array
    end
  end
  
  if ARGV.size == 2
    method = ARGV[0].to_i
    file = ARGV[1]
    array = read_array(file)
    p
    if method == 1
      min = find_min(array)
      if min.nil?
        puts "Массив пуст"
      else
        puts "Минимальный элемент массива: #{min}"
      end
    elsif method == 2
      index = first_found(array)
      if index == -1
        puts "Нет положительных элементов"
      else
        puts "Номер первого положительного элемента массива: #{index+1}"
      end
    else
      puts "Введите либо 1, либо 2"
    end
  else
    puts "Введите 2 аргумента"
  end