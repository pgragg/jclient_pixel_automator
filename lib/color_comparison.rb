class ColorComparison
  def self.color_difference_sum(color1, color2)
    first = (color1[0] - color2[0]).abs
    second = (color1[1] - color2[1]).abs
    third = (color1[2] - color2[2]).abs
    first + second + third
  end

  def self.similar?(color1, color2)
    sum = color_difference_sum(color1, color2)
    p sum
    similar = ( sum < 5)
  end

  def self.any_similar?(color:, color_list:)
    color_list.any? do |list_color| 
      ColorComparison.similar?(color, list_color)
    end
  end
end