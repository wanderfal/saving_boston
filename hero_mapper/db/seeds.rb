require 'redis'

def populate_database
  api_data_total = Heroe.marvel_api_call['data']['total']
  if api_data_total > Heroe.count
    Heroe.save_hero_data
  end
  puts "Populated Database..."
end

populate_database

# GEOADD using Redis
@redis = Redis.new
def add_hero_locations
  popular_heroes = Heroe.popular_heroes
  CITIES.each_with_index do |(city, geo), i|
    lat = geo[0]
    long = geo[1]
    hero = popular_heroes[i]
    @redis.geoadd('Marvel', long, lat, hero.name)
  end
  puts "Finished populating cities with Hero..."
end

add_hero_locations

# def add_magneto(city)
#   coord = CITIES[city]
#   lat = coord[0]
#   long = coord[1]
#   @redis.geoadd('Marvel', long, lat, 'Magneto')
#   puts "Found Magneto..."
# end

# add_magneto('Boston')

