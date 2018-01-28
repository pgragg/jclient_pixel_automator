class ColorExplorer
  include CliClick
  include Barbarians
  include TrackLocations
  def initialize
    p "POS: #{current_mouse_pos}"
    p "Color: #{current_mouse_color} "
    ColorComparison.any_similar?(color: current_mouse_color, color_list: barbarian_colors)
  end
end