require_relative 'deep_dup.rb'

class DataTable

    include Deep_dup

    def initialize(data)
      self.data = data
    end

    private def data=(data)
      unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
        raise ArgumentError, "получен не двумерный массив"
      end
      @data = deep_dup(data)
    end
    
    def row_count
      @data.size
    end

    def column_count
      return 0 if @data.empty?
      @data[0].size
    end

    def get_element(row, column)
      raise IndexError, "некорректная строка" if row < 0 || row >= row_count
      raise IndexError, "некорректный столбец" if column < 0 || column >= column_count
      deep_dup(@data)[row][column]
    end

    def to_s 
      @data.inspect
    end
end