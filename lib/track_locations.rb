module TrackLocations
  def init_tracking
    @xs = []
    @ys = []
  end

  def track_loc(loc)
    @xs << loc.x
    @ys << loc.y
  end

  def print_all_locs_visited
    p @xs
    p @ys
  end
end