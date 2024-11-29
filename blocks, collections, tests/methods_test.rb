require 'minitest/autorun'
require_relative 'array_processing.rb'

class Tests <  Minitest::Test

    def setup
        @test = Processing.new([-1, 2, 3, 4, -5, 2, -12, 34, 4])
    end

    def test_count
        assert_equal 6, @test.count {|element|  element>0}
        assert_equal 6, @test.count { |element| element.even?}
    end

    def test_group_by
        res_1 = @test.group_by { |element| element.even? }
        expec_1 = { true => [2, 4, 2, -12, 34, 4], false => [-1, 3, -5] }
        assert_equal expec_1, res_1

        res_2 = @test.group_by { |element| element<0 }
        expec_2 = { true => [-1, -5, -12], false => [2, 3, 4, 2, 34, 4] }
        assert_equal expec_2, res_2
    end

    def test_partition
        res_1 = @test.partition { |element| element>0 }
        expec_1 = [[2, 3, 4, 2, 34, 4], [-1, -5, -12]]
        assert_equal expec_1, res_1

        res_2 = @test.partition { |element| element.even? }
        expec_2 = [[2, 4, 2, -12, 34, 4], [-1, 3, -5]]
        assert_equal expec_2, res_2
    end
    
    def test_take_while
        result1 = @test.take_while { |el| el < 5 }
        expected1 = [-1, 2, 3, 4, -5, 2, -12]
        assert_equal expected1, result1

        result2 = @test.take_while { |el| el < 0 }
        expected2 = [-1]
        assert_equal expected2, result2
    end

    def test_min
        assert_equal -12, @test.min {|a,b| a<b}
        assert_equal -5, @test.min {|a, b| a<b && a.odd?}
    end

    def test_filter_map
        res_1 = @test.filter_map {|element| element if element.even?}
        expec_1 = [2, 4, 2, -12, 34, 4]
        assert_equal expec_1, res_1

        res_2 = @test.filter_map {|element| element if element>5}
        expec_2 = [34]
        assert_equal expec_2, res_2
    end
end
