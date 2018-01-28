class Pos
  attr_reader :x, :y

  def initialize(points)
    @x = points[0].to_i
    @y = points[1].to_i
  end

  def to_s
    [x, y].to_s
  end

  def to_a
    [x, y]
  end

  def far_from(pos, amount = 5)
    x_sq = (pos.x - x)**2
    y_sq = (pos.y - y)**2
    Math.sqrt((x_sq - y_sq).abs) > amount
  end
  
end