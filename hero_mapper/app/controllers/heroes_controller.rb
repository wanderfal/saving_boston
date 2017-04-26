require 'digest/md5'

class HeroesController < ApplicationController

  def index

    render "heroes"
  end

  def all
    # Marvel API only returns a maximum of 100 results per call
    # There are 1485 characters
    # Some results are organizations such as H.Y.D.R.A
    # Some comics are collections of individual issues
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
    hash = Digest::MD5.hexdigest( timestamp + ENV['MARVEL_PRIVATE'] + ENV['MARVEL_PUBLIC'] )
  end
  
end 