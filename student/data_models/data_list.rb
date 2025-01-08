require_relative 'deep_dup.rb'
require_relative 'data_table.rb'

class DataList

    include Deep_dup
    
    def initialize(data)
        self.data = data
        @selected = []
    end

    protected def data=(data)
        unless data.is_a?(Array)
			raise ArgumentError, "получен не массив"
		end
        @data = data.map { |element| deep_dup(element) }
    end

    def select(index)
        raise ArgumentError, 'некорректный индекс' unless  index >= 0 && index < @data.size
        element = @data[index]
        @selected << element unless @selected.include?(element)
    end

    def get_selected
        deep_dup(@selected)
    end

    def get_names
        raise NotImplementedError, "метод не реализован"
    end
    
    def get_data
        res = @data.map.with_index do |element, index|
            self.make_row(index)
        end
        DataTable.new(res)
    end
    
    def make_row(index)
        raise NotImplementedError, "метод не реализован"
    end

end
