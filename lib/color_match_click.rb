module ColorMatchClick

  def color_match_click(current_coords, coords, color_to_match)
    color_at_coords = get_color(coords)
    if ColorComparison.similar?(color_at_coords, color_to_match)
       move_smoothly_to_coords(current_coords, coords)
    end
  end


  def move_smoothly_to_coords(current_coords, coords)
    puts "moving from #{current_coords} to #{coords}"
    amount = 10
    while current_coords.far_from(coords, amount)
      if coords.x > current_coords.x
        x = current_coords.x + amount
      end
      if coords.x < current_coords.x
        x = current_coords.x - amount
      end
      if coords.y > current_coords.y
        y = current_coords.y + amount
      end
      if coords.y < current_coords.y
        y = current_coords.y - amount
      end
      current_coords = get_new_coords(Pos.new([x,y]))
      move_mouse current_coords
    end
    new_coords = get_new_coords(current_mouse_pos)
    click_pos new_coords
  end

end