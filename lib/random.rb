class RandomPixelAmount
  attr_reader :value
  def initialize
    @value = rand(15)/10.0
  end
end

class RandomMilliseconds
  attr_reader :value
  def initialize
    @value = rand(10)/5.0
  end
end