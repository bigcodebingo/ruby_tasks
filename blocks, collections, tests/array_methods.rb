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

def separate_even_odd_indices(array)
    even_elements = array.each_with_index.select { |_, index| index.even? }.map { |element, _| element }
    odd_elements = array.each_with_index.select { |_, index| index.odd? }.map { |element, _| element }
    (even_elements + odd_elements).join(' ')
end


array = [2,3,4,5, 6, 7, 8, 9]

puts cyclic_shift(array)

  
 