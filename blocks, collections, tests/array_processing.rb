class Processing

    attr_reader :array

    def initialize(array)
        @array = array
    end

    def count
        count = 0
        @array.each do |element|
            count += 1 if yield(element)
        end
        count
    end

    def group_by
        res ={}
        @array.each do |element|
            key = yield(element)
            res[key] ||= []
            res[key] << element
        end
        res
    end

    def partition
        true_res = []
        false_res = []
        @array.each do |element|
            if yield(element)
                true_res << element
            else 
                false_res << element    
            end
        end
        [true_res, false_res]
    end

    def take_while
        res = []
        @array.each do |element|
            break unless yield(element)
            res << element
        end
        res
    end
    
    def min
        return nil if @array.empty?
        min_el = @array.first
        @array.each do |element|
            min_el = element if yield(element,min_el)
        end 
        min_el
    end

    def filter_map
        res = []
        @array.each do |element|
            new_el = yield(element)
            res << new_el if new_el
        end 
        res
    end
end