module CliClick

  def arrow_left
     `cliclick kp:arrow-left`
  end
  def arrow_right
     `cliclick kp:arrow-right`
  end

  def click_current_mouse_pos
    pos = current_mouse_pos
    click_pos(pos)
  end

  def click_pos(pos)
    `cliclick c:#{pos.x},#{pos.y}`
  end

  def current_mouse_pos
    current_mouse_pos = `cliclick p`.split(',')
    p1 = current_mouse_pos[0].split(':')[1].gsub(' ', '').to_i
    p2 = current_mouse_pos[1].gsub("\n", '').to_i
    Pos.new([ p1, p2 ])
  end

  def get_color(pos)
    color = `cliclick cp:#{pos.x},#{pos.y}`
    color.gsub("\n",'').split(' ').map(&:to_i)
  end

  def current_mouse_color
    pos = current_mouse_pos
    get_color(pos)
  end

  def move_mouse(pos)
    `cliclick m:#{pos.x},#{pos.y}`
  end

end