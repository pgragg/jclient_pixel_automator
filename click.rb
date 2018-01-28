Dir.glob('lib/*').map {|file| load file}

class Clicker
  include CliClick
  include NewPoint
  include ColorMatchClick
  def initialize
    ask_click_pos
    ask_move_pos
    ask_move_back_pos
    loop_click
  end

  def loop_click
    p "Press a key to start macro"
    gets.chomp
    5.times do
      rand(80).times do 
        move_smoothly_to_coords(current_mouse_pos, @click_pos)
        sleep (1.3 + RandomMilliseconds.new.value)
      end
      color_match_click(current_mouse_pos, @move_pos, @move_pos_c)
      sleep (3 * RandomMilliseconds.new.value)
      color_match_click(current_mouse_pos, @move_back_pos, @move_back_pos_c)
      sleep (3 * RandomMilliseconds.new.value)
    end
  end

  def ask_click_pos
    p "Please press enter when your mouse is over"
    p "the place you want to click"
    gets.chomp
    @click_pos = current_mouse_pos
    @click_pos_c = get_color(@click_pos)
    p @click_pos
  end

  def ask_move_pos
    p "Please press enter when your mouse is over"
    p "the place you want to move to"
    gets.chomp
    @move_pos = current_mouse_pos
    @move_pos_c = get_color(@move_pos)
    p @move_pos_c
    p "now move there and refocus on the terminal"
  end

  def ask_move_back_pos
    p "Please press enter when your mouse is over"
    p "the place you left"
    gets.chomp
    @move_back_pos = current_mouse_pos
    @move_back_pos_c = get_color(@move_back_pos)
    p @move_back_pos
    p "now move there and refocus on the terminal"
  end

end

Clicker.new