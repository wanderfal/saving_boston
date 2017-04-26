require 'digest/md5'

class HeroesController < ApplicationController

  def index

    render "heroes"
  end

  def all
    url = 'https://gateway.marvel.com:443/v1/public/characters?limit=100' + '&ts=' + timestamp + '&apikey=' + ENV["MARVEL_PUBLIC"] + '&hash=' + marvel_hash
    # debugger
    uri = URI(url)
    response = Net::HTTP.get(uri)
    render json: JSON.parse(response)
  end
  
  private

  def timestamp
    Time.now.to_i.to_s
  end
  
  def marvel_hash
    # time = Time.now.to_i.to_s
    hash = Digest::MD5.hexdigest( timestamp + ENV['MARVEL_PRIVATE'] + ENV['MARVEL_PUBLIC'] )
    # hash = Digest::MD5.new
    # hash.update "time"
    # hash.update ENV['MARVEL_PRIVATE']
    # hash.update ENV['MARVEL_PUBLIC']
    # hash.hexdigest
  end
  
end 