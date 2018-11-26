class Parcel

  def initialize(length, width, height, weight)
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  def volume
    @length * @width * @height
  end

  def dimensional_weight
    (volume.to_f / 139.to_f).to_i.ceil
  end

  def surface_area
    2 * ((@height * @width)+(@height * @length)+(@width * @length))
  end

  def cost_to_wrap(wrapping_paper_cost)
    wrapping_units_used = (surface_area.to_f / 432.to_f).to_i.ceil
    wrapping_units_used * wrapping_paper_cost
  end

  def ship_weight_check
    if (@dim_weight > @weight)
      @dim_weight
    else
      @weight
    end
  end

  def cost_to_ship (ship_speed, weight_tier)
    weight_tier + ship_speed
  end

end
