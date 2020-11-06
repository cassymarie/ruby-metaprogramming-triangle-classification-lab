


class Triangle
  attr_accessor :a, :b, :c, :sides, :kind


    def initialize(a,b,c)

      raise TriangleError unless valid?([a,b,c]) 
      raise TriangleError unless !inequality?([a,b,c])

      @a = a
      @b = b
      @c = c
      @sides = [@a, @b, @c]
      type
    end

    def type
      total_uniq = @sides.uniq.size
      case total_uniq
      when 1
        @kind = :equilateral
      when 2
        @kind = :isosceles
      when 3
        @kind = :scalene
      else
        @kind = :invalid
      end
      @kind
    end

    def valid?(num_arr)
      num_arr.all? {|x| x > 0} && !num_arr.empty? && num_arr.size == 3 ? true : false
    end

    def inequality?(arr)
      (arr[0] + arr[1] <= arr[2] || arr[0] + arr[2] <= arr[1] || arr[1] + arr[2] <= arr[0]) ? true : false
    end

    class TriangleError < StandardError
      ## dont really know after this -- kinda confused.
      message = "Hey - thats wrong!"
    end
  
end
