class Point
  include ActiveModel::Model

  attr_accessor :x, :y

  def coordinates
    [x, y]
  end

  def eql?(other)
    self.==(other)
  end

  def equation_for(other)
    b = y - slope_with(other) * x
    ->(x) { slope_with(other) * x + b }
  end

  def hash
    [x, y].hash
  end

  def slope_with(point)
    return nil if (point.x - x).zero?

    Rational(point.y - y, 1) / Rational(point.x - x, 1)
  end

  def within_boundaries?(boundaries)
    boundaries[:x].include?(x) && boundaries[:y].include?(y)
  end

  def x_distance_from(point)
    (x - point.x).abs
  end

  def y_distance_from(point)
    (y - point.y).abs
  end

  def ==(other)
    other.class == self.class && other.x == x && other.y == y
  end
end
