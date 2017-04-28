class Heroe < ApplicationRecord
  validates :marvel_id, uniqueness: true

  def self.save_hero_data
    response_count = nil
    until response_count == 0
      character_data = marvel_api_call['data']
      if !character_data['results'].empty?
        character_data['results'].each do |hero|
          character = Heroe.new( :name => hero['name'], :comics => hero['comics']['available'], :marvel_id => hero['id'] )
          character.save
        end
        response_count = character_data['count']
      else
        break
      end
      
    end
  end

  def self.popular_heroes
    Heroe.order(comics: :desc).limit(15)
  end
  
  
  private

  def self.marvel_api_call
    url = "https://gateway.marvel.com:443/v1/public/characters?orderBy=modified&limit=100&offset=#{Heroe.count}&ts=#{timestamp}&apikey=#{ENV['MARVEL_PUBLIC']}&hash=#{marvel_hash}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
  end
    
  def self.marvel_hash
    hash = Digest::MD5.hexdigest( timestamp + ENV['MARVEL_PRIVATE'] + ENV['MARVEL_PUBLIC'] )
  end

  def self.timestamp
    Time.now.to_i.to_s
  end

end
