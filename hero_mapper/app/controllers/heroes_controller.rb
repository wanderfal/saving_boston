require 'digest/md5'

class HeroesController < ApplicationController

  def index
    @popular_heroes = Heroe.popular_heroes
    render "heroes"
  end

end 