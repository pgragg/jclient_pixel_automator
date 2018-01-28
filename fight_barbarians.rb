Dir.glob('lib/*').map {|file| load file}

class AutoRs
  include CliClick
  include Barbarians
  include ReadFile
  attr_accessor :start_pos, :end_pos, :x, :y, :rails

  def initialize 
    # @start_pos =  Pos.new([21, 103]) #Pos.new([3, 50])
    # @end_pos = Pos.new([528, 433]) # Pos.new([512, 378]) 
    @start_pos =  Pos.new([3, 50])
    @end_pos = Pos.new([512, 378]) 
    @rails = read_file('data/mouse_track_1.json')
    @x ||= (@end_pos.x - @start_pos.x)/2
    @y ||= (@end_pos.y - @start_pos.y)/2
  end

  def should_click?
    ColorComparison.any_similar?(
      {
        color: current_mouse_color, 
        color_list: barbarian_colors 
      }
    )
  end

  def fight_barbarians
    p "Current pos: #{x}, #{y}"
    
    rails.each do |pos| 
      pos = Pos.new(pos)
      self.x = get_new_point(pos.x, {lower_limit: start_pos.x, upper_limit: end_pos.x})
      self.y = get_new_point(pos.y, {lower_limit: start_pos.y, upper_limit: end_pos.y})
      # Randomize position a bit
      new_pos = Pos.new( [x, y] ) 
      move_mouse( new_pos )
      # sleep(RandomMilliseconds.new.value)
  
      if should_click?
        p "CLICKING BARBARIAN at #{new_pos}"
        click_pos(new_pos)
        [0,1].sample.even? ? arrow_left : arrow_right
        sleep(rand(180)/43.0)
      end
    end
    fight_barbarians

  end


end


AutoRs.new.fight_barbarians





