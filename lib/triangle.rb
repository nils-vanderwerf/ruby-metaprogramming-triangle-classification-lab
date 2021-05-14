class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
     validate_triangle
      if side1 == side2 && side2 == side3 
        :equilateral
      elsif side1 == side2 || side2 == side3 || side1 == side3
        :isosceles
      else 
        :scalene 
      end
  end

  def validate_triangle
    all_sides = [side1, side2, side3]
    real_triangle = 
    [
    (side1 + side2 > side3), 
    (side1 + side3 > side2), 
    (side2 + side3 > side1)
  ]
    all_sides.each do | side |
      all_sides << false if side == 0
      raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
