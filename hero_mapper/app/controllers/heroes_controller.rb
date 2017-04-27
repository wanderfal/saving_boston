require 'digest/md5'

class HeroesController < ApplicationController

  def index

    render "heroes"
  end

  def all
    # Marvel API only returns a maximum of 100 results per call
    # There are 1485 characters
    # Will need to offset by 100 every call, 15 times to populate database
    # Some results are organizations such as H.Y.D.R.A
    # Some comics are collections of individual issues
    # url = "https://gateway.marvel.com:443/v1/public/characters?limit=100&offset=10&ts=#{timestamp}&apikey=#{ENV['MARVEL_PUBLIC']}&hash=#{marvel_hash}"
    # debugger
    # uri = URI(url)
    # response = Net::HTTP.get(uri)
    # @response = JSON.parse(response)
    # render json: JSON.parse(response)

    # test
    # <% @response['data']['results'].each do |hero| %>
    #  <%= hero['name'] %>
    # <% end %>
    # render "heroes"
    Heroe.save_hero_data
  end

end 