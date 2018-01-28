# USAGE: 
# ruby define_macro.rb 200 mouse_track_1
# ruby fight_barbarians.rb

Dir.glob('lib/*.rb').map {|file| load file}

class DefineMacro
  include CliClick
  include Barbarians
  include TrackLocations
  require 'json'

  def initialize
    @macro_length = ARGV[0].to_i
    @macro_name = ARGV[1]

    track_mouse
    write_to_file

    p File.open("data/#{@macro_name}.json", 'r').read
  end

  def track_mouse
    i = 0
    @tracking = []
    while i < @macro_length
      p "#{i}/#{@macro_length}"
      i += 1 
      @tracking << current_mouse_pos.to_a
    end
  end

  def write_to_file
    f = File.new("data/#{@macro_name}.json", 'w')
    f.puts @tracking.to_json
    f.close
  end

end

DefineMacro.new