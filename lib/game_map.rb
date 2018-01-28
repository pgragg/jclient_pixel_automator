# class GameMap
#   include CliClick
#   include Barbarians
#   require 'json'

#   def initialize
#     @start_pos =  Pos.new([3, 50])
#     @end_pos = Pos.new([512, 378]) 
#   end

#   def map_game
#     colors = []
#      Array(@start_pos.x..@end_pos.x).each do |x|
#       colors[x] = []
#       Array(@start_pos.y..@end_pos.y).each do |y|
#         if y % 100 == 0
#           pos = Pos.new([x,y])
#           color = get_color(pos)
#           colors[x] << color
#         else
#           colors[x] << [0,0,0]
#         end
#       end
#      end
#     p colors
#   end

# end

# # GameMap.new.map_game