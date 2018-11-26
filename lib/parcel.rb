class Parcel


  def initialize(length, width, height, weight, ship_speed)
    ship_options = Hash.new()
      ship_options.store("Ground", 10)
      ship_options.store("Three Day", 15)
      ship_options.store("Second Day", 20)
      ship_options.store("Next Day Air", 25)
    cost_tiers = Hash.new()
      cost_tiers.store(1..10, 10)
      cost_tiers.store(11..20, 20)
      cost_tiers.store(21.30, 30)
      cost_tiers.store(31..40, 40)
      cost_tiers.store(41..50, 50)
      cost_tiers.store(51..60, 60)
      cost_tiers.store(61..250, 150)

    @length = length
    @width = width
    @height = height
    @weight = weight
    @ship_speed = ship_speed
    @dim_weight = dimensional_weight
    @ship_option = ship_options.fetch(ship_speed)
    @cost_tier = cost_tiers.select {|key| key === ship_weight_check}.values.first
  end

  def volume
    @length * @width * @height
  end

  def dimensional_weight
    (volume / 139).ceil
  end

  def ship_weight_check
    if (@dim_weight > @weight)
      @dim_weight
    else
      @weight
    end
  end

  def ship_cost
    # binding.pry
    "$" + (@cost_tier + @ship_option).to_s + ".00"
  end


end
