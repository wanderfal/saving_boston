class Heroe < ApplicationRecord
  validates :name, uniqueness: true

  def self.save_hero_data
    # offset = 0
    response_count = nil
    # until response_count == 0
      # character_data = marvel_api_call
      # if character_data['data']['results'].empty?

      # end
      
    # end
  end
  
  private

  def self.marvel_api_call
    url = "https://gateway.marvel.com:443/v1/public/characters?limit=100&offset=#{offset}&ts=#{timestamp}&apikey=#{ENV['MARVEL_PUBLIC']}&hash=#{marvel_hash}"
    debugger
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
  end

  def self.offset
    Heroe.count
  end
    
  def self.marvel_hash
    hash = Digest::MD5.hexdigest( timestamp + ENV['MARVEL_PRIVATE'] + ENV['MARVEL_PUBLIC'] )
  end

  def self.timestamp
    Time.now.to_i.to_s
  end

end
