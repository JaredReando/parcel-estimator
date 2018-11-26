require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/parcel')
require('pry')


get('/') do
  erb(:input)
end

get('/output') do
  length = params.fetch('length').to_i
  width = params.fetch('width').to_i
  height = params.fetch('height').to_i
  weight = params.fetch('weight').to_i
  @ship_speed = params.fetch('ship_speed')

  test_parcel = Parcel.new(length, width, height, weight, @ship_speed)
  @result = test_parcel.volume
  @ship_cost = test_parcel.ship_cost()
  erb(:output)
end
