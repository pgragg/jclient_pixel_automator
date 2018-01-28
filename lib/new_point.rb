module NewPoint
  def get_new_point(int, opts = {})
    lower_limit = opts.fetch(:lower_limit, nil)
    upper_limit = opts.fetch(:upper_limit, nil)
    amount = opts.fetch(:amount, RandomPixelAmount.new.value)
    operator = [:+, :-].sample

    output = int.send(operator, amount)

    output = limit(output, lower_limit, upper_limit)

    output
  end

  def get_new_coords(coords, opts = {})
    amount = opts.fetch(:amount, RandomPixelAmount.new.value)
    x = get_new_point(coords.x, amount: amount)
    y = get_new_point(coords.y, amount: amount)
    Pos.new([x,y])
  end

  private

  def limit(output, lower_limit, upper_limit)
    if lower_limit
      output = lower_limit if output < lower_limit
    end
    if upper_limit
      output = upper_limit if output > upper_limit
    end
    output
  end

end