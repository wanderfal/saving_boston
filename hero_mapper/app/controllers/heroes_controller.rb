require 'digest/md5'

class HeroesController < ApplicationController

  def index
    @popular_heroes = Heroe.order(comics: :desc).limit(15)
    render "heroes"
  end

  def all
    # Marvel API only returns a maximum of 100 results per call
    # There are 1485 characters
    # Will need to offset by 100 every call, 15 times to populate database
    # Some results are organizations such as H.Y.D.R.A
    # Some comics are collections of individual issues
    api_data_total = Heroe.marvel_api_call['data']['total']
    if api_data_total > Heroe.count
      Heroe.save_hero_data
    end
  
  end

end 