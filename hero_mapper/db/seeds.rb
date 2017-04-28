require 'redis'

# GEOADD using Redis
redis = Redis.new

# redis.GEOADD
CITIES = { "NYC" => [40.730610, -73.935242],
           "Boston" => [42.364506, -71.038887],
           "DC" => [38.894207, -77.035507],
           "Chicago" => [41.881832, -87.623177],
           "Indianapolis" => [39.832081, -86.145454],
           "LA" => [34.052235, -118.243683],
           "SF" => [37.733795, -122.446747],
           "Dallas" => [32.897480, -97.040443],
           "Denver" => [39.742043, -104.991531],
           "Seattle" => [47.608013, -122.335167],
           "New Orleans" => [29.951065, -90.071533],
           "Orlando" => [28.538336, -81.379234],
           "Baltimore" => [39.299236, -76.609383],
           "Minneapolis" => [44.986656, -93.258133],
           "Cleveland" => [41.505493, -81.681290]
          }

def test_call
  popular_heroes = Heroe.popular_heroes
  CITIES.each_with_index do | (city, geo), i|
    debugger
    puts city + geo + i
  end
  

end

test_call




def populate_database
  api_data_total = Heroe.marvel_api_call['data']['total']
  if api_data_total > Heroe.count
    Heroe.save_hero_data
  end
  puts "Populated Database"
end

populate_database