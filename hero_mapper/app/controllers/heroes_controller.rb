require 'digest/md5'

class HeroesController < ApplicationController

  def index
    @popular_heroes = Heroe.popular_heroes
    @nearby_heroes = Heroe.nearby_heroes('Boston')
    render "heroes"
  end

end 