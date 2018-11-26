require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/parcel')
require('pry')


get('/') do
  erb(:input)
end

get('/output') do
  ship_options = Hash.new()
    ship_options.store("Ground", 10)
    ship_options.store("Three Day", 15)
    ship_options.store("Second Day", 20)
    ship_options.store("Next Day Air", 25)
  weight_tiers = Hash.new()
    weight_tiers.store(1..10, 10)
    weight_tiers.store(11..20, 20)
    weight_tiers.store(21..30, 30)
    weight_tiers.store(31..40, 40)
    weight_tiers.store(41..50, 50)
    weight_tiers.store(51..60, 60)
    weight_tiers.store(61..Float::INFINITY, 150)

  length = params.fetch('length').to_i
  width = params.fetch('width').to_i
  height = params.fetch('height').to_i
  weight = params.fetch('weight').to_i
  @ship_speed_text = params.fetch('ship_speed')
  ship_speed_value = ship_options.fetch(@ship_speed_text)


  weight_tier = weight_tiers.select {|key| key === weight }.values.first


  test_parcel = Parcel.new(length, width, height, weight)
  @parcel_volume = test_parcel.volume
  @ship_cost = test_parcel.cost_to_ship(ship_speed_value, weight_tier)
  @gift_wrap_cost = test_parcel.cost_to_wrap(2)
  erb(:output)
end

class 
